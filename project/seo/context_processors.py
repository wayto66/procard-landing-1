from django.utils.functional import SimpleLazyObject

from .models import StaticPage


def seo_title_descripton(request):

   return {
      'seo': SimpleLazyObject(lambda: StaticPage.objects.filter(url=request.path).first()),
   }
