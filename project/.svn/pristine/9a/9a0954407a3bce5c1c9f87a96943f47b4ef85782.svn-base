
from django.db import models
from django.utils import timezone


class AutoCreatedField(models.DateTimeField):
    """
    A DateTimeField that automatically populates itself at
    object creation

    By Default, sets editable=False, default=datetime.now
    """
    def __init__(self, *args, **kwargs):
        kwargs.setdefault('editable', False)
        kwargs.setdefault('default', timezone.now)
        super().__init__(*args, **kwargs)


class AutoModifiedField(AutoCreatedField):
    """
    A DateTimeField that updates itself on each save() of the model.

    By Default, sets editable=False, default=datetime.now
    """
    def pre_save(self, model_instance, add):
        value = timezone.now()
        setattr(model_instance, self.attname, value)
        return value
