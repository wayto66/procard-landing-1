"""django URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

from . import views
from utils.views import ordenacao


urlpatterns = [
    # admin
    path('admin/', admin.site.urls),
    path('grappelli/', include('grappelli.urls')),
    path('admin/ordem/<action>/<int:id>/<app_label>/<model>/', ordenacao),

    # libs
    path('ckeditor/', include('ckeditor_uploader.urls')),
    path('politica-de-privacidade/', include('lgpd.urls', namespace='lgpd')),
    path('newsletter/', include('newsletter.urls', namespace='newsletter')),

    # path('fale-conosco/', include('contatos.urls', namespace='contatos')),

    # apps
    path('', views.home, name='home'),
]

if settings.DEBUG:
    urlpatterns += static(
        settings.STATIC_URL,
        document_root=settings.STATIC_ROOT
    )
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
