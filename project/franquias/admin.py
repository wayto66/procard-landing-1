# -*- coding: utf-8 -*-
from django.contrib import admin
from django.template.loader import render_to_string

from sorl.thumbnail.admin import AdminImageMixin
from grappelli.forms import GrappelliSortableHiddenMixin
from utils.admin import OrderableAdmin,SingleObjectMixin

from .models import  Beneficios

@admin.register(Beneficios)
class BeneficiosAdmin(SingleObjectMixin, admin.ModelAdmin):
    list_display = (
        'titulo',
    )