import re

from django import forms


def contem_url(texto):
    """
    Retorna True se o texto tiver um link
    """
    regexp = re.compile(r'https?://|www')
    try:
        return bool(regexp.search(texto))
    except TypeError:
        return False


class AntiBotModelForm(forms.ModelForm):
    """
    Ex:

    class ContatoForm(AntiBotModelForm):
        ANTIBOT_FIELDS = [
            'nome',
            'mensagem',
        ]

        class Meta:
            model = Contato
            fields = (
                'nome',
                'email',
                'telefone',
                'mensagem',
            )

    """

    ANTIBOT_FIELDS = []

    def clean(self):
        data = super(AntiBotModelForm, self).clean()
        for attr in self.ANTIBOT_FIELDS:
            if contem_url(data.get(attr)):
                self.add_error(attr, 'Não é permitido url')

        return data


class AntiBotForm(forms.Form):

    ANTIBOT_FIELDS = []

    def clean(self):
        data = super(AntiBotForm, self).clean()
        for attr in self.ANTIBOT_FIELDS:
            if contem_url(data.get(attr)):
                self.add_error(attr, 'Não é permitido url')
        return data
