from django.contrib import admin
from newsletter.models import Newsletter
from seo.admin import SEOAdminMixin
from utils.actions import export_as_csv_action


class NewsletterAdmin(admin.ModelAdmin):
    list_display = ('email_newsletter', 'created_at')
    ordering = ('-id',)

    actions = (
        export_as_csv_action(
            fields=[
                'email_newsletter',
            ],
            header=False,
            filename='newsletters.csv'
        ),
    )

    def get_actions(self, request):
        """
        Remove o action de deletar itens
        """
        actions = super(NewsletterAdmin, self).get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions

admin.site.register(Newsletter, NewsletterAdmin)
