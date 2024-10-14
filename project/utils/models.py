
from django.db import models, IntegrityError, transaction
from django.utils.html import format_html
from django.db.models import Manager

from ckeditor_uploader.fields import RichTextUploadingField

from .fields import AutoCreatedField, AutoModifiedField
from .querysets import OrderableQueryset


class TimeStampedModel(models.Model):

    created_at = AutoCreatedField('Criado em')
    updated_at = AutoModifiedField('Atualizado em')

    class Meta:
        abstract = True


class FlatPageModel(TimeStampedModel):

    texto = RichTextUploadingField('Texto')

    def __str__(self):
        return 'Texto: {}'.format(self.pk)

    class Meta:
        abstract = True


"""
A manager for Orderables. If you customise your model's manager, be sure to inherit from
this rather than django.db.models.Manager; it's required for the drag/drop ordering
to work in the admin.
"""
OrderableManager = Manager.from_queryset(OrderableQueryset)


class OrderableModel(models.Model):
    """
    Ex. de uso:
    admin.py

    from utils.models import OrderableModel
    class Banner(OrderableModel):
        ...

        class Meta(OrderableModel.Meta):
            ...

    """

    position = models.PositiveIntegerField('Posição', default=0)

    objects = OrderableManager()

    class Meta:
        abstract = True
        ordering = ['position',]

    def ordenar(self):
        model_name = self.__class__.__name__.lower()
        app_label = self._meta.app_label
        html_posicao = '<a href="/admin/ordem/up/{pk}/{app}/{model}/">Subir</a> / <a href="/admin/ordem/down/{pk}/{app}/{model}/">Descer</a>'
        return format_html(
            html_posicao,
            pk=self.pk,
            app=app_label,
            model=model_name
        )

    def trocar_posicao(self):
        return format_html(
            '<span id="neworder-{}" class="sorthandle">{}</span>',
            self.id, self.position,
        )
    trocar_posicao.short_description = 'Ordem'
    trocar_posicao.admin_order_field = 'position'

    def get_unique_fields(self):
        """List field names that are unique_together with `position`."""
        for unique_together in self._meta.unique_together:
            if 'position' in unique_together:
                unique_fields = list(unique_together)
                unique_fields.remove('position')
                return ['%s_id' % f for f in unique_fields]
        return []

    def get_filtered_manager(self):
        manager = self.__class__.objects
        kwargs = {field: getattr(self, field) for field in self.get_unique_fields()}
        return manager.filter(**kwargs)

    def next(self):
        if not self.position:
            return None

        return self.get_filtered_manager().after(self)

    def prev(self):
        if not self.position:
            return None

        return self.get_filtered_manager().before(self)

    def validate_unique(self, exclude=None):
        if self._is_position_unique_together_with_something():
            exclude = exclude or []
            if 'position' not in exclude:
                exclude.append('position')
        return super().validate_unique(exclude=exclude)

    def _is_position_unique_together_with_something(self):
        """
        Is the position field unique_together with something
        """
        unique_together = self._meta.unique_together
        for fields in unique_together:
            if 'position' in fields and len(fields) > 1:
                return True
        return False

    @staticmethod
    def _update(qs):
        """
        Increment the position in a queryset.

        Handle IntegrityErrors caused by unique constraints.
        """
        try:
            with transaction.atomic():
                qs.update(position=models.F('position') + 1)
        except IntegrityError:
            for obj in qs.order_by('-position'):
                qs.filter(pk=obj.pk).update(position=models.F('position') + 1)

    def _save(self, objects, old_pos, new_pos):
        """WARNING: Intensive giggery-pokery zone."""
        to_shift = objects.exclude(pk=self.pk) if self.pk else objects

        # If not set, insert at end.
        if self.position is None:
            self._move_to_end(objects)

        # New insert.
        elif not self.pk and not old_pos:
            # Increment `position` on objects with:
            #     position > new_pos.
            to_shift = to_shift.filter(position__gte=self.position)
            self._update(to_shift)
            self.position = new_pos

        # self.position decreased.
        elif old_pos and new_pos < old_pos:
            self._move_to_end(objects)
            super().save()
            # Increment `position` on objects with:
            #     position >= new_pos and position < old_pos
            to_shift = to_shift.filter(position__gte=new_pos, position__lt=old_pos)
            self._update(to_shift)
            self.position = new_pos

        # self.position increased.
        elif old_pos and new_pos > old_pos:
            self._move_to_end(objects)
            super().save()
            # Decrement position on objects with:
            #     position <= new_pos and position > old_pos.
            to_shift = to_shift.filter(position__lte=new_pos, position__gt=old_pos)
            to_shift.update(position=models.F('position') - 1)
            self.position = new_pos

    def _move_to_end(self, objects):
        """Temporarily save `self.position` elsewhere (max_obj)."""
        max_obj = objects.all().aggregate(models.Max('position'))['position__max']
        self.position = max_obj + 1 if max_obj else 1

    def _unique_togethers_changed(self):
        for field in self.get_unique_fields():
            if getattr(self, '_original_%s' % field, False):
                return True
        return False

    def save(self, *args, **kwargs):
        """Keep the unique order in sync."""
        objects = self.get_filtered_manager()
        old_pos = getattr(self, '_original_position', None)
        new_pos = self.position

        if old_pos is None and self._unique_togethers_changed():
            self.position = None
            new_pos = None

        try:
            with transaction.atomic():
                self._save(objects, old_pos, new_pos)
        except IntegrityError:
            with transaction.atomic():
                old_pos = objects.filter(pk=self.pk).values_list(
                    'position', flat=True)[0]
                self._save(objects, old_pos, new_pos)

        # Call the "real" save() method.
        super().save(*args, **kwargs)
