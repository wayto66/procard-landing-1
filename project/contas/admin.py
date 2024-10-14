from django.contrib import admin

from django.contrib.auth.admin import Group as BaseGroup
from django.contrib.auth.admin import (
    UserAdmin as BaseUserAdmin,
    GroupAdmin as BaseGroupAdmin
)
from django.utils.translation import ugettext, ugettext_lazy as _

from .models import User, Group
from .forms import UserAdminCreationForm, UserAdminChangeForm


@admin.register(User)
class UserAdmin(BaseUserAdmin):

    list_display = [
        'email',
        'first_name',
        'username',
        'is_active',
        'is_staff',
        'is_superuser',
        'date_joined',
    ]
    add_form = UserAdminCreationForm
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'username', 'password1', 'password2'),
        }),
    )

    form = UserAdminChangeForm
    fieldsets = (
        (None, {'fields': ('email', 'username', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name',)}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )

    ordering = ['-id']


@admin.register(Group)
class GroupAdmin(BaseGroupAdmin):
    pass


admin.site.unregister(BaseGroup)
