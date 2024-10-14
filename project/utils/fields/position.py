
from django.db import models


class PositionField(models.PositiveIntegerField):
    """
    PositiveIntegerField without zero
    """
    def formfield(self, **kwargs):
        defaults = {'min_value': 1}
        defaults.update(kwargs)
        return super().formfield(**defaults)
