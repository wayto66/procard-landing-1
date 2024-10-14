
from django.forms.models import model_to_dict


class ModelDiffMixin(object):
    """
    A model mixin that tracks model fields' values and provide some useful api
    to know what fields have been changed.
    """

    HANDLE_FIELDS = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.__initial = self._dict

    @property
    def diff(self):
        d1 = self.__initial
        d2 = self._dict
        diffs = [(k, (v, d2[k])) for k, v in d1.items() if v != d2[k]]
        return dict(diffs)

    @property
    def has_changed(self):
        return bool(self.diff)

    @property
    def changed_fields(self):
        return self.diff.keys()

    def get_field_diff(self, field_name):
        """
        Returns a diff for field if it's changed and None otherwise.
        """
        return self.diff.get(field_name, None)

    def has_field_changed(self, field_name):
        return bool(self.get_field_diff(field_name))

    def save(self, *args, **kwargs):
        """
        Saves model and set initial state.
        """
        super().save(*args, **kwargs)
        self.__initial = self._dict

    def _get_observed_fields(self):
        return self.HANDLE_FIELDS or [field.name for field in self._meta.fields]

    @property
    def _dict(self):
        return model_to_dict(
            self,
            fields=self._get_observed_fields()
        )


def handle_delete(instance, attr, sorl=False):
    attribute = getattr(instance, attr)
    if not sorl:
        try:
            attribute.delete(save=False)
        except:
            pass
    else:
        from sorl.thumbnail import delete
        try:
            delete(attribute)
        except:
            pass


class RemoveFilesMixin(ModelDiffMixin):
    """
    A model mixin that checks if the images has changed and replaces them
    with the new ones or delete them
    """

    # Implement this list in your model with the name of the attributes
    DELETE_FILE_ATTR = []
    DELETE_SORL_ATTR = []

    def _get_observed_fields(self):
        return list(set(self.HANDLE_FIELDS + self.DELETE_FILE_ATTR + self.DELETE_SORL_ATTR))

    def save(self, *args, **kwargs):
        """
        It Loops through the attributes and checks if they've changed.
        If so, it deletes the previous one and save the new one
        """
        if self.pk:
            for attr in self.DELETE_FILE_ATTR:
                has_changed = self.has_field_changed(attr)
                if has_changed:
                    instance = self.__class__.objects.get(pk=self.pk)
                    handle_delete(instance=instance, attr=attr)
            for attr in self.DELETE_SORL_ATTR:
                has_changed = self.has_field_changed(attr)
                if has_changed:
                    instance = self.__class__.objects.get(pk=self.pk)
                    handle_delete(instance=instance, attr=attr, sorl=True)
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        """
        It Loops through the attributes and tries to delete them
        """
        for attr in self.DELETE_FILE_ATTR:
            handle_delete(instance=self, attr=attr)
        for attr in self.DELETE_SORL_ATTR:
            handle_delete(instance=self, attr=attr, sorl=True)
        super().delete(*args, **kwargs)
