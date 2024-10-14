from django.conf import settings
from django.utils.functional import SimpleLazyObject

from .models import EmbedHTML, Contato


def embed_html(request):

    return {
        'embed_head': EmbedHTML.objects.filter(tag=EmbedHTML.HEAD),
        'embed_body': EmbedHTML.objects.filter(tag=EmbedHTML.BODY),
        'SITE_NAME': settings.SITE_NAME,
        'CONTATO_OBJ': SimpleLazyObject(lambda: Contato.objects.first()),        
    }
