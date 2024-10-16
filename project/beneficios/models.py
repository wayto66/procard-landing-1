# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.urls import reverse
from unidecode import unidecode
from ckeditor_uploader.fields import RichTextUploadingField
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField

from utils.models import TimeStampedModel, OrderableModel
from utils.fields import AutoSlugField
from utils.upload import upload_files
from utils.mixins import RemoveFilesMixin
from utils.upload import upload_files


class Sobre(TimeStampedModel):
    titulo = models.CharField('Título', max_length=255)
    resenha = RichTextUploadingField('Resenha', config_name='basic', blank=True)
    
    class Meta:
        verbose_name = 'Sobre'
        verbose_name_plural = 'Sobre'

    def __str__(self):
        return self.titulo


class Investimento(TimeStampedModel, OrderableModel):
    subtitulo = models.CharField('Subtítulo', max_length=255, blank=True)
    imagem = ImageField(
        upload_to=upload_files,
        help_text='Tamanho recomendado: 44x46 pixels'
    )
    nome = models.CharField('Nome', max_length=255)
    preco = models.CharField('Preço', max_length=255)
    legenda = models.CharField('legenda', max_length=255, blank=True)

    DELETE_SORL_ATTR = [
        'imagem',
    ]
    
    class Meta(OrderableModel.Meta):
        verbose_name = 'Investimento'
        verbose_name_plural = 'Investimentos'
    
    def __str__(self):
        return self.nome

