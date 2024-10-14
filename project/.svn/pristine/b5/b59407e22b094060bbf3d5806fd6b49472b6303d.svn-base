
from django.contrib.auth.backends import ModelBackend as BaseModelBackend
from django.contrib.auth import get_user_model


UserModel = get_user_model()


class ModelBackend(BaseModelBackend):
    """
    Authenticates against settings.AUTH_USER_MODEL.
    """

    def authenticate(self, request, username=None, password=None):

        if not username is None:
            try:
                user = UserModel.objects.get(username=username)
            except UserModel.DoesNotExist:
                pass
            else:
                if user.check_password(password):
                    return user
