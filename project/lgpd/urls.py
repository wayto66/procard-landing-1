from django.urls import path

from . import views

app_name = 'lgpd'
urlpatterns = [
    path('', views.lgpd, name='lgpd'),
]
