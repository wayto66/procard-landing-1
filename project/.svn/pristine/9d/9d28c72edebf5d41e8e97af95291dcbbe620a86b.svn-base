from django.contrib import admin

from utils.admin import SingleObjectMixin

from .models import EmbedHTML, Contato


@admin.register(EmbedHTML)
class EmbedHTMLAdmin(admin.ModelAdmin):
    list_display = (
        'tag',
        'created_at',
        'updated_at',
    )


@admin.register(Contato)
class ContatoAdmin(SingleObjectMixin, admin.ModelAdmin):
    list_display = [
        '__str__',
        'updated_at',
    ]
