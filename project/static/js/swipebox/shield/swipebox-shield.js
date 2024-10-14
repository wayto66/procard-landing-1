var insertSwipeboxShield = function(){
    $('body').append('<span id="swipeboxshield"></span>');
}

var removeSwipeboxShield = function(){
    var swipeboxshield = $("#swipeboxshield");
    setTimeout(function(){
        swipeboxshield.remove();
    }, 200);
}

function callSwipeboxPlugin(){
    // Evita que o touch se propague para outros elementos
    $('.swipebox').swipebox({
        afterOpen: insertSwipeboxShield,
        afterClose: removeSwipeboxShield,
        hideBarsDelay : 0,
        removeBarsOnMobile: false
    });
}

$(function(){
    // callSwipeboxPlugin();
});
