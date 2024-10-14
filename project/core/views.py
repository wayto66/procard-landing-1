
from django.shortcuts import render
from newsletter.forms import NewsletterForm
from beneficios.models import Sobre, Investimento
from franquias.models import Beneficios
from banners.models import Banner 

def home(request):
    newsletter_form = NewsletterForm()
    sobre = Sobre.objects.first()
    investimentos = Investimento.objects.all()
    beneficios = Beneficios.objects.first()
    banner =  Banner.objects.first()

    context = {
        'newsletter_form': newsletter_form,   
        'sobre':sobre, 
        'investimentos':investimentos,
        'beneficios':beneficios,
        'banner':banner,
    }

    return render(request, 'home.html', context)
