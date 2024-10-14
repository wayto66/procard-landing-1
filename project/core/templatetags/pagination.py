from django.template import Library


register = Library()


@register.inclusion_tag('utils/_pagination.html')
def pagination(request, paginator, page_obj):
    context = dict()
    context['paginator'] = paginator
    context['request'] = request
    context['page_obj'] = page_obj
    getvars = request.GET.copy()
    if 'page' in getvars:
        del getvars['page']
    if len(getvars) > 0:
        context['getvars'] = '&{0}'.format(getvars.urlencode())
    else:
        context['getvars'] = ''

    num_pages = 6
    page_range = range_pagination(paginator, page_obj, number=num_pages)

    context['page_range'] = page_range

    return context


def range_pagination(paginator, page_obj, number=6):

    _list = list(paginator.page_range)
    index = _list.index(page_obj.number)

    return sublist(_list, index, number)


def sublist(full_list, index, quantity):

    '''
        Return a sublist of a list according
        to the index and number of elements
        Ex.:
        full_list = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        index = 2 (full_list[2] == 8)
        quantity = 7
        returned:
        [6, 7, 8, 9, 10, 11, 12]
    '''

    len_list = len(full_list)
    if len_list == 0:
        return []

    _sublist = []
    cont = quantity if quantity <= len_list else len_list

    _sublist.append(full_list[index])
    cont -= 1

    distance_from_index = 1
    set_lower = True
    set_upper = True

    while cont > 0:
        if index - distance_from_index < 0:
            set_lower = False
        if index + distance_from_index >= len_list:
            set_upper = False

        if set_lower:
            _sublist.insert(0, full_list[index - distance_from_index])
            cont -= 1
            if cont <= 0:
                break

        if set_upper:
            _sublist.append(full_list[index + distance_from_index])
            cont -= 1

        distance_from_index += 1

    return _sublist

