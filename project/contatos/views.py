from django.shortcuts import render, redirect

from .forms import ContatoForm
from curriculos.forms import CurriculoForm


def contato_form(request):

    if request.method == 'POST':
        form = ContatoForm(request.POST, auto_id='id_contato-%s')
        if form.is_valid():
            obj = form.save()
            obj.send_mail(fail_silently=True)
            return redirect('contatos:contato_form_ok')
    else:
        form = ContatoForm(auto_id='id_contato-%s')


    context = {
        'form': form,
    }

    return render(request, 'contatos/contato_form.html', context)


def contato_form_ok(request):
    context = {
    }
    return render(request, 'contatos/contato_form_ok.html', context)
