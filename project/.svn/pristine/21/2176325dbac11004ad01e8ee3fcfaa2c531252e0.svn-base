
from django.apps import apps
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.http import HttpResponseRedirect
from django.views.generic import TemplateView, DetailView
from django.views.generic.detail import SingleObjectMixin
from django.views.generic.edit import BaseFormView


class FlatPageView(SingleObjectMixin, TemplateView):
    template_name = 'utils/flatpage.html'

    def get_object(self):
        return self.model.objects.first()

    def get_page_name(self):
        if hasattr(self, 'page_name'):
            return self.page_name
        else:
            return self.model._meta.verbose_name.title()

    def get_page_class(self):
        if hasattr(self, 'page_class'):
            return self.page_class
        else:
            return ''

    def get_breadcumbs(self):
        if hasattr(self, 'breadcumbs'):
            return self.breadcumbs
        else:
            return []

    def get_context_data(self, *args, **kwargs):
        self.object = self.get_object()
        context = super().get_context_data(*args, **kwargs)
        context['page_name'] = self.get_page_name()
        context['page_class'] = self.get_page_class()
        context['breadcumbs'] = self.get_breadcumbs()
        return context


def csrf_failure(request, reason=""):

    messages.error(
        request,
        """Ocorreu um erro inesperado com a sessão.\
        Por gentileza, repita a operação."""
    )
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


class FormDetailView(DetailView, BaseFormView):
    def post(self, request , *args , **kwargs):
        self.object = self.get_object()
        return super().post(request, *args, **kwargs)


@login_required
@staff_member_required
def ordenacao(request, action, id, app_label, model):
    i = 1
    obj_model = apps.get_model(app_label, model)
    registros = obj_model.objects.all().order_by('position')
    for item in registros:
        item.position = i
        item.save()
        i = i + 1

    registro1 = obj_model.objects.get(pk=id)
    try:
        if action == 'down':
            registro2 = obj_model.objects.get(position=registro1.position + 1)
        else:
            registro2 = obj_model.objects.get(position=registro1.position - 1)

        tmp1 = registro1.position
        tmp2 = registro2.position

        registro1.position = tmp2
        registro2.position = tmp1

        registro1.save()
        registro2.save()
    except:
        pass

    return HttpResponseRedirect(request.META['HTTP_REFERER'])
