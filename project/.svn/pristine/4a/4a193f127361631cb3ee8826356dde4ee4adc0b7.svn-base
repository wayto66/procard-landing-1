# -*- coding: utf-8 -*-
from django.contrib import admin

from .models import StaticPage


@admin.register(StaticPage)
class StaticPageAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'url',
        'seo_title',
    )
    list_display_links = [
        'id',
        'url',
    ]
    fields = (
        'url',
        'seo_title',
        'seo_description',
    )


class SEOAdminMixin(object):
    """
        Coloca os campos de SEO no final da página
    """

    def get_fields(self, request, obj=None):
        fields = super().get_fields(request, obj)

        fields.remove('seo_title')
        fields.remove('seo_description')
        # fields.append('seo_title')
        # fields.append('seo_description')

        return fields

    def get_fieldsets(self, request, obj=None):
        fieldsets = super().get_fieldsets(request=request, obj=obj)
        fieldsets.append(('SEO', {'fields': ['seo_title', 'seo_description']}))
        return fieldsets
