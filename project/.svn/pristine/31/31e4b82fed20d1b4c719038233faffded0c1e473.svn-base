MANUAL DE USO


Como utilizar em páginas avulsas
==================================

Cadastrando na Home:

    1) No painel admin, acesse 'Início > SEO > Títulos e descrições' e faça um cadastro com o valor '/' em 'url'

    2) Insira o novo título da página ou Description.



Como utilizar em páginas dinâmicas
==================================

Cadastrando uma Notícia:

    1) Em noticias/models.py

    ```
        from seo.models import SEOModel


        class Noticia(SEOModel, ...):
            ...
    ```

    2) Em noticias/admin.py

        2.1) Sem fields ou fieldsets explícitos:

        ```
            from seo.admin import SEOAdminMixin


            class NoticiaAdmin(SEOAdminMixin, ...):
                ...
        ```

        2.2) Com fields explícitos:
        ```
            from seo.admin import SEOAdminMixin


            class NoticiaAdmin(SEOAdminMixin, ...):
                ...
                fields = (
                    ...
                    'seo_title',
                    'seo_description',
                )
        ```

        2.3) Com fieldsets explícitos:
        ```
            from seo.admin import SEOAdminMixin


            class NoticiaAdmin(SEOAdminMixin, ...):
                ...
                fieldsets = (
                    ...
                    ('SEO', {'fields': ('seo_title', 'seo_description',)}),
                )
        ```
