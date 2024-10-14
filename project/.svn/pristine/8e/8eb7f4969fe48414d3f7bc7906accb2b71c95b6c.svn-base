# coding: utf-8
from unidecode import unidecode

from django.utils.text import slugify as django_slugify
from django.utils import six


def slugify(value):
    """
    Slugify a string (even if it contains non-ASCII chars)
    """
    # Re-map some strings to avoid important characters being stripped.  Eg
    # remap 'c++' to 'cpp' otherwise it will become 'c'.
    # for k, v in settings.OSCAR_SLUG_MAP.items():
    #    value = value.replace(k, v)

    # Use unidecode to convert non-ASCII strings to ASCII equivalents where
    # possible if unicode is not allowed to contain in slug.
    value = unidecode(six.text_type(value))

    value = django_slugify(six.text_type(value))
    # Remove stopwords
    # for word in settings.OSCAR_SLUG_BLACKLIST:
    #     value = value.replace(word + '-', '')
    #     value = value.replace('-' + word, '')

    return value
