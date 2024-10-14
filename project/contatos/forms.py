from django import forms
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.utils import timezone
from django.conf import settings

# from captcha.fields import ReCaptchaField

from .models import Contato


class ContatoForm(forms.ModelForm):
    # captcha = ReCaptchaField()

    class Meta:
        model = Contato
        fields = (
            'nome',
            'email',
            'telefone',
            'mensagem',
        )
