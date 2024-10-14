# -*- coding: utf-8 -*-
import re

from django.db import models
from django.core.validators import EMPTY_VALUES
from django.forms import ValidationError
from django.forms import fields
from django.utils.encoding import force_text


def only_digits(value):
    return re.sub(r'[^0-9]', '', str(value))


class TelefoneFormField(fields.CharField):
    """
    A form field that validates input as a Brazilian phone number.
    The phone number must be in either of the following formats: (XX) XXXX-XXXX or (XX) XXXXX-XXXX.
    .. deprecated:: 1.4
        Use the django-phonenumber-field_ library instead.
    .. _django-phonenumber-field: https://github.com/stefanfoulis/django-phonenumber-field
    """

    default_error_messages = {
        # 'invalid': ('O telefone deve estar no seguinte formato: '
        #               '(XX) XXXX-XXXX ou (XX) XXXXX-XXXX.'),
        'invalid': ('Requer: (XX) XXXX-XXXX ou (XX) XXXXX-XXXX.'),
    }

    # phone_digits_re = re.compile(r'^(\d{2})[-\.]?(\d{4,5})[-\.]?(\d{4})$')
    phone_digits_re = re.compile(r'(\d{2})(\d{4,5})(\d{4})')

    def clean(self, value):
        super().clean(value)
        if value in EMPTY_VALUES:
            return ''

        value = only_digits(force_text(value))
        m = self.phone_digits_re.search(value)
        try:
            return '({}) {}-{}'.format(m.group(1), m.group(2), m.group(3))
        except AttributeError:
            raise ValidationError(self.error_messages['invalid'])


class TelefoneField(models.CharField):

    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = kwargs.get('max_length', 15)
        super().__init__(*args, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'form_class': TelefoneFormField}
        defaults.update(kwargs)
        return super().formfield(**defaults)
