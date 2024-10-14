# -*- coding: utf-8 -*-
from django.contrib import admin
from django.template.loader import render_to_string

from sorl.thumbnail.admin import AdminImageMixin
from grappelli.forms import GrappelliSortableHiddenMixin
from utils.admin import OrderableAdmin,SingleObjectMixin

from .models import Sobre, Investimento

@admin.register(Sobre)
class SobreAdmin(SingleObjectMixin, admin.ModelAdmin):
    list_display = (
        'titulo',
    )

@admin.register(Investimento)
class InvestimentoAdmin(OrderableAdmin, admin.ModelAdmin):
    list_display = (
        'nome',
        'trocar_posicao',
    )