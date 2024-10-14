from django.core.paginator import InvalidPage, Paginator
from django.http import Http404
from django.utils.translation import gettext as _


def paginate_queryset(request, queryset, page_size, orphans=0, 
        allow_empty_first_page=True, page_kwarg='page', **kwargs):
    """
    Ex. de uso em views.py:

    from utils.pagination import paginate_queryset
    
    def anyfuntion(request):
        paginate_by = 12
        qs = Produto.objects.all()
        extra_context = paginate_queryset(
            request=request, 
            queryset=qs,
            page_size=paginate_by,
        )

        context = {
            ...
        }
        context.update(extra_context)
        return render(request, 'template.html', context)
    """
    paginator = Paginator(
        queryset, 
        page_size, 
        orphans=orphans, 
        allow_empty_first_page=allow_empty_first_page
    )
    page = request.GET.get(page_kwarg) or 1
    try:
        page_number = int(page)
    except ValueError:
        if page == 'last':
            page_number = paginator.num_pages
        else:
            raise Http404(_("Page is not 'last', nor can it be converted to an int."))

    try:
        page = paginator.page(page_number)
    except InvalidPage as e:
        raise Http404(_('Invalid page (%(page_number)s): %(message)s') % {
            'page_number': page_number,
            'message': str(e)
        })

    if page_size:
        context = {
            'paginator': paginator,
            'page_obj': page,
            'is_paginated': page.has_other_pages(),
            'object_list': page.object_list
        }
    else:
        context = {
            'paginator': None,
            'page_obj': None,
            'is_paginated': False,
            'object_list': queryset
        }

    return context
