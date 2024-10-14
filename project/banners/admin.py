# -*- coding: utf-8 -*-
from django.contrib import admin
from django.template.loader import render_to_string
from django.utils.html import format_html

from sorl.thumbnail.admin import AdminImageMixin

from utils.admin import OrderableAdmin, SingleObjectMixin
from .models import Banner


@admin.register(Banner)
class BannerAdmin(SingleObjectMixin, admin.ModelAdmin):
    list_display = (
        # 'thumb',
        'nome',
        # 'link',
        # 'target',
        # 'ativo',
        # 'trocar_posicao',
    )
    # list_filter = ('ativo',)
    # list_editable = ('position',)

    # def thumb(self, obj):
    #     context = {
    #         'image': obj.imagem,
    #     }
    #     return render_to_string('utils/_thumbnail.html', context)

    # def link(self, obj):
    #     if obj.url:
    #         return format_html('<a href="{url}" target="_blank">{url}</a>', url=obj.url)
    #     return ''
