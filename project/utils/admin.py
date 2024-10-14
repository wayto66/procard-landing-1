
from django.contrib import admin
from django.core.exceptions import PermissionDenied
from django.http import HttpResponse
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_protect


class SingleObjectMixin(object):

    def has_add_permission(self, *args, **kwargs):
        return not self.model.objects.exists()


class RestrictObjectMixin(object):
    """
        Restringe as permissões no painel admin
        a um determinado usuário
    """
    restrict_to = (
        'atualint',
    )

    def has_module_permission(self, request):
        return request.user.username in self.restrict_to

    def has_add_permission(self, request):
        return request.user.username in self.restrict_to

    def has_change_permission(self, request, obj=None):
        return request.user.username in self.restrict_to

    def has_delete_permission(self, request, obj=None):
        return request.user.username in self.restrict_to


class FlatPageAdmin(SingleObjectMixin, admin.ModelAdmin):
    list_display = (
        '__str__',
        'created_at',
        'updated_at',
    )


csrf_protect_m = method_decorator(csrf_protect)


class OrderableAdmin(admin.ModelAdmin):
    """
    jQuery orderable objects in the admin.

    You'll want your object to subclass orderable.models.Orderable and you
    want to add position_display to list_display.
    ------------------------------------------------------------------------
    Ex. de uso:
    admin.py

    from utils.admin import OrderableAdmin

    class BannerAdmin(OrderableAdmin, ... ):

        show_position = True  # Opcional. Default False

        list_display = (
            ...
            'trocar_posicao',  # ou 'ordenar'
            ...
        )
    """
    show_position = False

    def get_fields(self, request, obj=None):
        fields = super().get_fields(request, obj)

        if not self.show_position and 'position' in fields:
            fields.remove('position')
        return fields


    def get_urls(self):
        try:
            from django.conf.urls.defaults import url
        except ImportError:
            from django.conf.urls import url

        patterns = super().get_urls()
        patterns.insert(
            # insert just before (.+) rule
            # (see django.contrib.admin.options.ModelAdmin.get_urls)
            -1,
            url(
                r'^reorder/$',
                self.reorder_view,
                name=self.get_url_name()
            )
        )
        return patterns

    def get_url_name(self):
        meta = self.model._meta
        model_name = meta.model_name

        return '{0}admin_{1}_{2}_reorder'.format(
            self.admin_site.name, meta.app_label, model_name,
        )

    @csrf_protect_m
    def reorder_view(self, request):
        """The 'reorder' admin view for this model."""
        model = self.model

        if not self.has_change_permission(request):
            raise PermissionDenied

        if request.method == "POST":
            object_pks = request.POST.getlist('neworder[]')
            model.objects.set_orders(object_pks)

        return HttpResponse("OK")

    class Media:
        js = (
            'js/admin/adminorderable.js',
        )
        css = {
            'all': (
                'css/admin/admin-sortable-fix.css',
            ),
        }


# class OrderableTabularInline(admin.TabularInline):
#     """
#     jQuery orderable objects in the admin.

#     You'll want your object to subclass orderable.models.Orderable.
#     """
#     template = "admin/edit_inline/orderable_tabular.html"

#     class Media:
#         js = (
#             'js/adminorderable.js',
#         )
