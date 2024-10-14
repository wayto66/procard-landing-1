# -*- coding: utf-8 -*-
from django.db import models

from utils.models import TimeStampedModel


class EmbedHTML(TimeStampedModel):
    """
    Insere tags HTML em uma região específica da página
    """

    HEAD = 1
    BODY = 2
    TAGS_CHOICES = (
        (HEAD, 'Head'),
        (BODY, 'Body'),
    )

    tag = models.PositiveSmallIntegerField(
        'Elemento',
        choices=TAGS_CHOICES,
        unique=True,
        help_text='O código será inserido antes da tag '
        'correspondente ser fechada no html'
    )

    html = models.TextField(
        'Html',
        blank=True
    )

    class Meta:
        verbose_name = 'HTML Incorporado'
        verbose_name_plural = 'HTML Incorporado'
        ordering = ['tag',]


class Contato(TimeStampedModel):
    # endereco = RichTextUploadingField(
    #     'Endereço',
    #     blank=True,
    #     config_name='basic'
    # )
    link_whatsapp = models.CharField(
        'Link do whatsApp',
        max_length=255,
        blank=True,
        help_text='Ex.: https://wa.me/5516988888888'
    )

    class Meta:
        verbose_name = 'Informações para contato'
        verbose_name_plural = 'Informações para contato'

    def __str__(self):
        return f'Contato {self.pk}'
