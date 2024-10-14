# Generated by Django 2.2.27 on 2022-03-31 19:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('seo', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='staticpage',
            options={'ordering': ['url'], 'verbose_name': 'Título e descrição', 'verbose_name_plural': 'Títulos e descrições'},
        ),
        migrations.RenameField(
            model_name='staticpage',
            old_name='description',
            new_name='seo_description',
        ),
        migrations.RenameField(
            model_name='staticpage',
            old_name='title',
            new_name='seo_title',
        ),
        migrations.RemoveField(
            model_name='staticpage',
            name='page',
        ),
        migrations.AddField(
            model_name='staticpage',
            name='url',
            field=models.CharField(db_index=True, default='/', help_text='use "/" para página inicial, "/contato/" para a página contato, etc.', max_length=200, unique=True, verbose_name='Url da página'),
            preserve_default=False,
        ),
    ]
