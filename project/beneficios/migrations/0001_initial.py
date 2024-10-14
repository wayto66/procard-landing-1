# Generated by Django 2.2.28 on 2022-10-10 17:45

import ckeditor_uploader.fields
from django.db import migrations, models
import django.utils.timezone
import sorl.thumbnail.fields
import utils.fields.timestamped
import utils.upload


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Investimento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', utils.fields.timestamped.AutoCreatedField(default=django.utils.timezone.now, editable=False, verbose_name='Criado em')),
                ('updated_at', utils.fields.timestamped.AutoModifiedField(default=django.utils.timezone.now, editable=False, verbose_name='Atualizado em')),
                ('position', models.PositiveIntegerField(default=0, verbose_name='Posição')),
                ('subtitulo', models.CharField(max_length=255, verbose_name='Subtítulo')),
                ('imagem', sorl.thumbnail.fields.ImageField(help_text='Tamanho recomendado: 44x46 pixels', upload_to=utils.upload.upload_files)),
                ('nome', models.CharField(max_length=255, verbose_name='Nome')),
                ('preco', models.CharField(max_length=255, verbose_name='Preço')),
                ('legenda', models.CharField(max_length=255, verbose_name='legenda')),
            ],
            options={
                'verbose_name': 'Investimento',
                'verbose_name_plural': 'Investimentos',
                'ordering': ['position'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Sobre',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', utils.fields.timestamped.AutoCreatedField(default=django.utils.timezone.now, editable=False, verbose_name='Criado em')),
                ('updated_at', utils.fields.timestamped.AutoModifiedField(default=django.utils.timezone.now, editable=False, verbose_name='Atualizado em')),
                ('titulo', models.CharField(max_length=255, verbose_name='Título')),
                ('resenha', ckeditor_uploader.fields.RichTextUploadingField(blank=True, verbose_name='Resenha')),
            ],
            options={
                'verbose_name': 'Sobre',
                'verbose_name_plural': 'Sobre',
            },
        ),
    ]
