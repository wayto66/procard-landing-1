
import os

from django.utils.text import slugify


def upload_files(instance, filename):
    name, ext = os.path.splitext(filename)
    return 'upload/{}/{}/{}'.format(
        instance.__class__._meta.app_label,
        instance.__class__.__name__.lower(),
        slugify(name) + ext.lower()
    )


def upload_files_generic(instance, filename):
    name, ext = os.path.splitext(filename)
    return 'upload/{}/{}/{}'.format(
        instance.__class__._meta.app_label,
        instance.content_type.app_label,
        slugify(name) + ext.lower()
    )
