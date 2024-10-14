var phoneMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
},
optionsPhoneMask = {
    onKeyPress: function(val, e, field, options) {
        field.mask(phoneMaskBehavior.apply({}, arguments), options);
    }
};


function handleChat(){

    var fixedChat = $("#fixed-chat");
    var fixedChatHeightContent = $("#fixed-chat-content").outerHeight();
    if (fixedChat.hasClass("active")) {
        $("#fixed-chat-content").slideDown("fast");
        $("#fold_p").text("Clique aqui para minimizar!");

    }
    else{
        $("#fixed-chat-content").slideUp("fast");
        $("#fold_p").text("Clique aqui para saber mais!");

    }
}

// $('.close').click(function(){
//     $('.fixed-chat').css('display','none');
    
// });

function isMobile(){
    var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
    var desktop = 1024;

    return width >= desktop ? false : true;
}


function handleScrollChat(){
    if (!isMobile()) {
        var scroll = $(window).scrollTop();
        var limit = 730;
        if (scroll >= limit) {
            $("#fixed-chat").addClass("visible");
            // $("#fixed-chat").fadeIn();
            // $("#fixed-chat").animate({"opacity": 1});
            // $("#fixed-chat").animate({"z-index": 99999}, 0);
        } else {
            // $("#fixed-chat").animate({"opacity": 0});
            // $("#fixed-chat").animate({"z-index": 0}, 0);
            $("#fixed-chat").removeClass("visible");
            // $("#fixed-chat").fadeOut();
        }
    }    
}

$(function(){
    $('.phonemask').mask(phoneMaskBehavior, optionsPhoneMask);

    $("#fixed-chat .thumb").on("click", function(){
        $("#fixed-chat").toggleClass("active");
        handleChat();
    });

    handleScrollChat();
    $(window).scroll(function() {
        handleScrollChat();
    });

});
