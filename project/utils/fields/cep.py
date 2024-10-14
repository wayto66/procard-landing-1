# -*- coding: utf-8 -*-
import re

from django.db import models
from django.forms import fields
from django.core.validators import RegexValidator


postal_code_re = re.compile(r'^\d{5}[-]?\d{3}$')


def only_digits(value):
    return re.sub(r'[^0-9]', '', str(value))


class BRPostalCodeValidator(RegexValidator):
    """
    A validator for Brazilian Postal Codes (CEP).

    .. versionadded:: 2.2
    """

    def __init__(self, *args, **kwargs):
        self.message = 'O CEP deve ter o seguinte formato: 00000-000'
        super().__init__(postal_code_re, *args, **kwargs)


class CEPFormField(fields.CharField):
    """
    A form field that validates input as a Brazilian zip code, with the format XXXXX-XXX.

    .. versionchanged:: 2.2
        Use BRPostalCodeValidator to centralize validation logic and share with equivalent model field.
        More details at: https://github.com/django/django-localflavor/issues/334
    """

    default_error_messages = {
        'invalid': 'Insira o CEP no seguinte formato: XXXXX-XXX',
    }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.validators.append(BRPostalCodeValidator())

    def clean(self, value):
        """Value can be either a string in the format XXXXX-XX or an 8-digit number."""
        value = super().clean(value)
        if value in self.empty_values:
            return self.empty_value
        value = only_digits(value)
        return value


class CEPField(models.CharField):

    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = kwargs.get('max_length', 9)
        super().__init__(*args, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'form_class': CEPFormField}
        defaults.update(kwargs)
        return super().formfield(**defaults)
