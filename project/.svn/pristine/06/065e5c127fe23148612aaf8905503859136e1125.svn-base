import csv
from datetime import datetime

from django.http import HttpResponse
from django.utils import timezone




def export_as_csv_action(fields, headers=[], exclude=None, header=True, filename='export-data.csv',
    description="Exporta os registros selecionados como arquivo CSV", delimiter=';', format_date='%d/%m/%Y %H:%M'):
    """
    This function returns an export csv action
    'fields' and 'exclude' work like in django ModelForm
    'header' is whether or not to output the column names as the first row
    """
    def export_as_csv(modeladmin, request, queryset):
        """
        Generic csv export admin action.
        based on http://djangosnippets.org/snippets/1697/
        """
        # opts = modeladmin.model._meta
        # field_names = set([field.name for field in opts.fields])
        # if fields:
        #     fieldset = set(fields)
        #     field_names = field_names & fieldset

        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename={}'.format(filename)

        writer = csv.writer(response, delimiter=delimiter)
        # writer = csv.writer(response, delimiter=delimiter)
        if header:
            _headers = [n for n in headers]
            writer.writerow(_headers or fields)
        for obj in queryset:
            row = []
            for field in fields:
                value = getattr(obj, field)
                if isinstance(value, datetime):
                    value = timezone.localtime(value)
                    if format_date:
                        value = value.strftime(format_date)
                        
                row.append(value)

            writer.writerow(row)
        return response
    export_as_csv.short_description = description
    return export_as_csv


# Modo de usar no admin

# class NewsletterAdmin(admin.ModelAdmin):
#     list_display = ('nome','email', 'created_at')
#     ordering = ('-id',)

#     actions = (
#         export_as_csv_action(
#             fields=[
#                 'email',
#             ],
#             header=False,
#             filename='newsletters.csv'
#         ),
#     )

#     def get_actions(self, request):
#         """
#         Remove o action de deletar itens
#         """
#         actions = super(NewsletterAdmin, self).get_actions(request)
#         if 'delete_selected' in actions:
#             del actions['delete_selected']
#         return actions

# admin.site.register(Newsletter, NewsletterAdmin)