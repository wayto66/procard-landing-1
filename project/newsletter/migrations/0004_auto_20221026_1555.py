# Generated by Django 2.2.28 on 2022-10-26 18:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('newsletter', '0003_auto_20221026_1423'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='newsletter',
            options={'ordering': ['-id'], 'verbose_name': 'Formulário de Franquia', 'verbose_name_plural': 'Formulários de Franquia'},
        ),
    ]
