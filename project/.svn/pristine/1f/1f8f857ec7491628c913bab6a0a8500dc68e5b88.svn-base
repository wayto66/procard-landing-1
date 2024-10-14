from django.contrib import admin
from django.utils.html import format_html

from utils.actions import export_as_csv_action
from utils.admin import OrderableAdmin
from .models import Contato


@admin.register(Contato)
class ContatoAdmin(admin.ModelAdmin):
    list_display = (
        'nome',
        'email',
        'created_at',
    )
    search_fields = (
        'email',
        'assunto',
    )

    actions = (
        export_as_csv_action(
            fields=[
                'created_at',
                'nome',
                'email',
                'telefone',
                'assunto',
                'mensagem',
            ],
            filename='contatos.csv'
        ),
    )

    def get_actions(self, request):
        """
        Remove o action de deletar itens
        """
        actions = super().get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions
