# -*- coding: utf-8 -*-
from django.db import models

from sorl.thumbnail import ImageField

from utils.models import TimeStampedModel, OrderableModel
from utils.upload import upload_files
from utils.mixins import RemoveFilesMixin


class Banner(TimeStampedModel):

    # NOVA_JANELA = '_blank'
    # MESMA_JANELA = '_self'
    # TARGETS_CHOICES = (
    #     (MESMA_JANELA, 'Mesma janela'),
    #     (NOVA_JANELA, 'Nova janela'),
    # )
    nome = models.CharField(
        'Nome',
        max_length=128
    )

    titulo = models.CharField(
        'Titulo', 
        max_length=255
    )
    legenda = models.CharField(
        'Legenda', 
        max_length=255
    )


    # imagem = ImageField(
    #     upload_to=upload_files,
    #     help_text='Tamanho recomendado: 1920x1080 pixels'
    # )
    # url = models.URLField(
    #     blank=True
    # )
    # target = models.CharField(
    #     'Destino',
    #     max_length=32,
    #     choices=TARGETS_CHOICES,
    #     default=MESMA_JANELA
    # )
    # ativo = models.BooleanField(
    #     default=True,
    #     help_text='Exibir no site'
    # )

    # DELETE_SORL_ATTR = [
    #     'imagem',
    # ]

    def __str__(self):
        return self.nome

    class Meta:
        pass
