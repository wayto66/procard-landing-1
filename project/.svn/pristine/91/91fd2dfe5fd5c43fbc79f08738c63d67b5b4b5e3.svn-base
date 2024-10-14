$(function(){

    $('.smartlabel input, .smartlabel textarea').each(function(){

        $(this).parent().css({"position": "relative"});

        $(this).on('focus', function(){
            $(this).parent().addClass('active');
        });

        $(this).on('blur', function(){
            if ($(this).val().length == 0) {
                $(this).parent().removeClass('active');
            }
        });

        $(this).on('change', function(){
            if ($(this).val().length != 0) {
                $(this).parent().addClass('active');
            }
        });

        if ($(this).val() != ''){
            $(this).parent().addClass('active');
        }

    });
});