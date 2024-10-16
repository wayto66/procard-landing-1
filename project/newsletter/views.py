from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import FormView, TemplateView

from seo.models import StaticPage
from seo.views import SEOContextMixin

from .forms import NewsletterForm

class NewsletterFormView(FormView):
    template_name = 'newsletter/newsletter_form.html'
    form_class = NewsletterForm
    success_url = reverse_lazy('newsletter:newsletter_form_ok')

    def form_valid(self, form):
        form.save()
        form.send_email()
        return super(NewsletterFormView, self).form_valid(form)

class NewsletterFormOKView(TemplateView):
    template_name = 'newsletter/newsletter_form_ok.html'

newsletter = NewsletterFormView.as_view()
newsletter_form_ok = NewsletterFormOKView.as_view()