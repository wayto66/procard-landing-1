from django.urls import path

from . import views


app_name = 'contatos'
urlpatterns = [
    path('', views.contato_form, name='contato_form'),
    path('ok/', views.contato_form_ok, name='contato_form_ok'),    
]
