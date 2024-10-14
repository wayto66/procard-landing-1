if (!$) {
    $ = grp.jQuery;
}

$('document').ready(function () {
    // Only add the drag-n-drop reordering if this is not a paginated object (determined by the presense of a span, which isn't the best way to do it…)
    if ($("p.paginator > span"))
    {
        // Check grappelli prefix
        var grappelli_prefix = window.grappelli === undefined ? "" : "grp-";
        var table_select = $("#" + grappelli_prefix + "changelist table tbody");
        // Steal the draghandle's id and apply to the row
        table_select.find("tr").each(function() {
            var id = $(".sorthandle", this).attr("id");
            $(this).attr("id", id);
            $(".sorthandle", this).attr("id", "");
            //take it off the child
        });
        $(".sorthandle").parent().addClass("sorthandletd").css("cursor", "pointer");
        $(".sorthandle").html('<a href="javascript://" class="grp-icon grp-drag-handler ui-sortable-handle" title="Move Item"><i class="icon-grab"></i></a>');

        // Force a width onto all the tds (so they drag nicely)
        table_select.find("tr > *").each(function() {
            $(this).width($(this).width())
        });
        // Do the draggable
        table_select.sortable({
            'axis': 'y',
            // 'containment': 'parent',
            'cursor': 'crosshair',
            'handle': '.sorthandletd',
            'forcePlaceholderSize': true,
            'update': function(sorted) {
                var cereal = $(this).sortable("serialize");
                cereal += '&csrfmiddlewaretoken=' + $("input[name=csrfmiddlewaretoken]").val();
                var classflip = 1;
                table_select.find("tr").each(function() {
                    // redraw the tabel striping
                    $(this).removeClass("row1 row2");
                    if (classflip) {
                        $(this).addClass("row1");
                    }
                    else {
                        $(this).addClass("row2");
                    }
                    classflip = !classflip;
                });
                $.ajax({
                    url: "reorder/",
                    type: "POST",
                    data: cereal
                });
            }
        });
    }
});
