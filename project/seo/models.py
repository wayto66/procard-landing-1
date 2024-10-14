# -*- coding: utf-8 -*-
from django.db import models

from utils.models import TimeStampedModel


class SEOModel(models.Model):
    seo_title = models.CharField(
        'Título da Página',
        max_length=70,
        blank=True
    )
    seo_description = models.CharField(
        'Description',
        max_length=160,
        blank=True
    )

    class Meta:
        abstract = True


class StaticPage(TimeStampedModel, SEOModel):
    """
        Cadastra os parâmetros de SEO em páginas estáticas.
    """

    url = models.CharField(
        'Url da página', 
        max_length=200,
        unique=True, 
        db_index=True,
        help_text='use "/" para página inicial, "/contato/" para a página contato, etc.'
    )

    def __str__(self):
        return self.nome

    @property
    def nome(self):
        return self.url

    class Meta:
        verbose_name = 'Título e descrição'
        verbose_name_plural = 'Títulos e descrições'
        ordering = ['url',]
