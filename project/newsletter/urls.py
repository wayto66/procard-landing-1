# -*- coding: utf-8 -*-
from django.conf.urls import url

from . import views

app_name = 'newsletter'
urlpatterns = [
    url(r'^$', views.newsletter, name='newsletter_form'),
    url(r'^ok/$', views.newsletter_form_ok, name='newsletter_form_ok'),

    
]
