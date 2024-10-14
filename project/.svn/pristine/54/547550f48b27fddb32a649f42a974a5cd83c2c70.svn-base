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

class Beneficios(TimeStampedModel):
    titulo = models.CharField('Título', max_length=255)
    resenha = RichTextUploadingField('Resenha', config_name='basic')

    class Meta:
        verbose_name = 'Benefício'
        verbose_name_plural = 'Benefícios'