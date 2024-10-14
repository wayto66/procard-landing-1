from django.db import models
from django.conf import settings
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.utils import timezone

from utils.models import TimeStampedModel
from utils.fields import TelefoneField


class Contato(TimeStampedModel):

    nome = models.CharField(
        'Nome',
        max_length=128
    )
    email = models.EmailField(
        'Email'
    )
    telefone = TelefoneField(
        'Telefone',
        blank=True
    )
    mensagem = models.TextField(
        'Mensagem',
        max_length=2048
    )

    class Meta:
        verbose_name = 'Contato'
        verbose_name_plural = 'Contatos'
        ordering = ['-id']

    def __str__(self):
        return '{} ({})'.format(self.nome, self.email)

    def send_mail(self, fail_silently=False):

        template = 'emails/contato.txt'
        name = self.nome
        from_email = self.email
        subject_message = name
        
        lista_emails = [

        ]
        
        if len(lista_emails) > 0:
            to_email = lista_emails
        else:
            to_email = settings.EMAIL_RECEBIMENTO_PADRAO

        subject = f'[Contato]: {subject_message}'
        message = render_to_string(
            template, {
                'form': self,
                'data': timezone.now(),
            }
        )

        email = EmailMessage(
            subject=subject,
            body=message,
            to=to_email,
            reply_to=(from_email,)
        )

        return email.send(fail_silently=fail_silently)
