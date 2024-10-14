# coding: utf-8
from .forms import NewsletterForm


def newsletter(request):

    newsletter_form = NewsletterForm(auto_id='id_base_%s')

    return {
        'newsletter_form_base': newsletter_form,
    }
