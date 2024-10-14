# -*- coding: utf-8 -*-

import re

from django.db import models
from django import forms
from django.forms import fields
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator


cnpj_digits_re = re.compile(r'^(\d{2})[.-]?(\d{3})[.-]?(\d{3})/(\d{4})-(\d{2})$')
cpf_digits_re = re.compile(r'^(\d{3})\.(\d{3})\.(\d{3})-(\d{2})$')
cpf_cnpj_digits_re = re.compile(r'(?:^(\d{2})[.-]?(\d{3})[.-]?(\d{3})/(\d{4})-(\d{2})$)|(?:^(\d{3})\.(\d{3})\.(\d{3})-(\d{2})$)')


def only_digits(value):
    return re.sub(r'[^0-9]', '', str(value))


def dv_maker(v):
    if v >= 2:
        return 11 - v
    return 0


class BRCNPJValidator(RegexValidator):
    """
    Validator for brazilian CNPJ.

    .. versionadded:: 2.2
    """

    def __init__(self, *args, **kwargs):
        super().__init__(
            *args,
            regex=cnpj_digits_re,
            message="CNPJ Inválido",
            **kwargs
        )

    def __call__(self, value):
        orig_dv = value[-2:]

        if not value.isdigit():
            cnpj = cnpj_digits_re.search(value)
            if cnpj:
                value = ''.join(cnpj.groups())
            else:
                raise ValidationError(self.message, code='invalid')

        if len(value) != 14:
            raise ValidationError(self.message, code='max_digits')

        new_1dv = sum([i * int(value[idx]) for idx, i in enumerate(list(range(5, 1, -1)) + list(range(9, 1, -1)))])
        new_1dv = dv_maker(new_1dv % 11)
        value = value[:-2] + str(new_1dv) + value[-1]
        new_2dv = sum([i * int(value[idx]) for idx, i in enumerate(list(range(6, 1, -1)) + list(range(9, 1, -1)))])
        new_2dv = dv_maker(new_2dv % 11)
        value = value[:-1] + str(new_2dv)
        if value[-2:] != orig_dv:
            raise ValidationError(self.message, code='invalid')


class BRCPFValidator(RegexValidator):
    """
    Validator for brazilian CPF.

    .. versionadded:: 2.2
    """

    def __init__(self, *args, **kwargs):
        super().__init__(
            *args,
            regex=cpf_digits_re,
            message="CPF Inválido",
            **kwargs
        )

    def __call__(self, value):
        if not value.isdigit():
            cpf = cpf_digits_re.search(value)
            if cpf:
                value = ''.join(cpf.groups())
            else:
                raise ValidationError(self.message, code='invalid')

        if len(value) != 11:
            raise ValidationError(self.message, code='max_digits')

        orig_dv = value[-2:]
        new_1dv = sum([i * int(value[idx])
                       for idx, i in enumerate(range(10, 1, -1))])
        new_1dv = dv_maker(new_1dv % 11)
        value = value[:-2] + str(new_1dv) + value[-1]
        new_2dv = sum([i * int(value[idx])
                       for idx, i in enumerate(range(11, 1, -1))])
        new_2dv = dv_maker(new_2dv % 11)
        value = value[:-1] + str(new_2dv)
        if value[-2:] != orig_dv:
            raise ValidationError(self.message, code='invalid')
        if value.count(value[0]) == 11:
            raise ValidationError(self.message, code='invalid')


class CPFCNPJValidator(RegexValidator):
    """
    Validator for brazilian CPF or CNPJ.

    .. versionadded:: 2.2
    """

    def __init__(self, *args, **kwargs):
        super().__init__(
            *args,
            regex=cpf_cnpj_digits_re,
            message="Documento Inválido",
            **kwargs
        )

    def __call__(self, value):
        orig_dv = value[-2:]

        if not value.isdigit():
            documento = cpf_cnpj_digits_re.search(value)
            if documento:
                value = ''.join([x for x in documento.groups() if x is not None])
            else:
                raise ValidationError(self.message, code='invalid')

        if len(value) != 11 and len(value) != 14:
            raise ValidationError(self.message, code='max_digits')

        if len(value) == 11:
            orig_dv = value[-2:]
            new_1dv = sum([i * int(value[idx])
                           for idx, i in enumerate(range(10, 1, -1))])
            new_1dv = dv_maker(new_1dv % 11)
            value = value[:-2] + str(new_1dv) + value[-1]
            new_2dv = sum([i * int(value[idx])
                           for idx, i in enumerate(range(11, 1, -1))])
            new_2dv = dv_maker(new_2dv % 11)
            value = value[:-1] + str(new_2dv)
            if value[-2:] != orig_dv:
                raise ValidationError(self.message, code='invalid')
            if value.count(value[0]) == 11:
                raise ValidationError(self.message, code='invalid')

        if len(value) == 14:

            new_1dv = sum([i * int(value[idx]) for idx, i in enumerate(list(range(5, 1, -1)) + list(range(9, 1, -1)))])
            new_1dv = dv_maker(new_1dv % 11)
            value = value[:-2] + str(new_1dv) + value[-1]
            new_2dv = sum([i * int(value[idx]) for idx, i in enumerate(list(range(6, 1, -1)) + list(range(9, 1, -1)))])
            new_2dv = dv_maker(new_2dv % 11)
            value = value[:-1] + str(new_2dv)
            if value[-2:] != orig_dv:
                raise ValidationError(self.message, code='invalid')


class CPFFormField(fields.CharField):
    """
    A form field that validates a CPF number or a CPF string.

    A CPF number is compounded by XXX.XXX.XXX-VD. The two last digits are check digits.

    More information:
    http://en.wikipedia.org/wiki/Cadastro_de_Pessoas_F%C3%ADsicas

    .. versionchanged:: 2.2
        Use BRCPFValidator to centralize validation logic and share with equivalent model field.
        More details at: https://github.com/django/django-localflavor/issues/334
    """

    default_error_messages = {
        'invalid': 'CPF inválido',
        'max_digits': 'Este campo requer 11 dígitos ou 14 caracteres',
    }

    def __init__(self, max_length=14, min_length=11, *args, **kwargs):
        super().__init__(max_length=max_length, min_length=min_length, *args, **kwargs)
        self.validators.append(BRCPFValidator())

    def clean(self, value):
        """Value can be either a string in the format XXX.XXX.XXX-XX or an 11-digit number."""
        value = super().clean(value)
        if value in self.empty_values:
            return self.empty_value
        value = only_digits(value)
        return value


class CNPJFormField(fields.CharField):
    """
    A form field that validates input as `Brazilian CNPJ`_.

    Input can either be of the format XX.XXX.XXX/XXXX-XX or be a group of 14
    digits.

    If you want to use the long format only, you can specify:
        brcnpj_field = BRCNPJField(min_length=16)

    If you want to use the short format, you can specify:
        brcnpj_field = BRCNPJField(max_length=14)

    Otherwise both formats will be valid.

    .. _Brazilian CNPJ: http://en.wikipedia.org/wiki/National_identification_number#Brazil
    .. versionchanged:: 1.4
    .. versionchanged:: 2.2
        Use BRCNPJValidator to centralize validation logic and share with equivalent model field.
        More details at: https://github.com/django/django-localflavor/issues/334
    """

    default_error_messages = {
        'invalid': 'CNPJ inválido',
        'max_digits': 'Este campo requer 14 dígitos ou 18 caracteres',
    }

    def __init__(self, min_length=14, max_length=18, *args, **kwargs):
        super().__init__(max_length=max_length, min_length=min_length, *args, **kwargs)
        self.validators.append(BRCNPJValidator())

    def clean(self, value):
        """Value can be either a string in the format XX.XXX.XXX/XXXX-XX or a group of 14 characters."""
        value = super().clean(value)
        if value in self.empty_values:
            return self.empty_value
        value = only_digits(value)
        return value


class CPFCNPJFormField(forms.CharField):

    default_error_messages = {
        'invalid': 'Documento inválido',
        'max_digits': 'Este campo requer 14 ou 18 caracteres',
    }

    def __init__(self, min_length=11, max_length=18, *args, **kwargs):
        super().__init__(max_length=max_length, min_length=min_length, *args, **kwargs)
        self.validators.append(CPFCNPJValidator())

    def clean(self, value):
        """Value can be either a string in the format XX.XXX.XXX/XXXX-XX or a group of 14 characters."""
        value = super().clean(value)
        if value in self.empty_values:
            return self.empty_value
        value = only_digits(value)
        return value


class CPFField(models.CharField):

    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = kwargs.get('max_length', 14)
        super().__init__(*args, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'form_class': CPFFormField}
        defaults.update(kwargs)
        return super().formfield(**defaults)


class CNPJField(models.CharField):

    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = kwargs.get('max_length', 18)
        super().__init__(*args, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'form_class': CNPJFormField}
        defaults.update(kwargs)
        return super().formfield(**defaults)


class CPFCNPJField(models.CharField):

    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = kwargs.get('max_length', 18)
        super().__init__(*args, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'form_class': CPFCNPJFormField}
        defaults.update(kwargs)
        return super().formfield(**defaults)
