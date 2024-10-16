# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django import forms
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.utils import timezone
from django.utils.timezone import now

from .models import Newsletter

class NewsletterForm(forms.ModelForm):
    class Meta:
        model = Newsletter
        fields = (
            'nome',
            'email_newsletter',
            'telefone',
            'cidade_reside',
            'cidade_interesse',

        )

    def send_email(self):

        template = 'emails/newsletter.txt'
        name = self.cleaned_data.get('email_newsletter')
        from_email = self.cleaned_data.get('email_newsletter')
        subject_message = self.cleaned_data.get('email_newsletter')

        to_email = [
            'contato@procardbeneficios.com.br',
        ]
        subject = '[Procard - Formulário de licença] {}'.format(subject_message)
        message = render_to_string(
            template, {
                'form': self.cleaned_data,
                'data': now(),
            }
        )

        email = EmailMessage(

            subject=subject,
            body=message,
            to=to_email,
            reply_to=(from_email,)
        )
        return email.send()
