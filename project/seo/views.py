# -*- coding: utf-8 -*-
from .models import StaticPage


class SEOContextMixin:
    """
        Adiciona o objeto SEO correspondente ao contexto da view
    """
    page = None

    def get_seo(self):
        return StaticPage.objects.filter(
            page=self.page,
        ).first()

    def get_context_data(self, **kwargs):
        kwargs['seo'] = self.get_seo()
        return super().get_context_data(**kwargs)
