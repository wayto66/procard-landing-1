# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from unidecode import unidecode

from django.db import models
from utils.models import TimeStampedModel
from utils.fields import TelefoneField

class Newsletter(TimeStampedModel):
    nome = models.CharField('Nome Completo', max_length=255)
    email_newsletter = models.EmailField(
        'E-mail',
        unique=True
    )
    telefone = TelefoneField(
        'Telefone com DDD',
        blank=True
    )
    cidade_reside = models.CharField('Cidade onde reside', max_length=255)
    cidade_interesse = models.CharField('Cidade de interesse', max_length=255)


    class Meta:
        verbose_name = 'Formulário de Franquia'
        verbose_name_plural = 'Formulário de Franquia'
        ordering = ['-id']

    def __str__(self):
        return self.email_newsletter