var div = document.createElement('div');
div.id = 'toast-js';
div.style.display = 'none';
var tagP = document.createElement('p');
div.appendChild(tagP);
document.getElementsByTagName('body')[0].appendChild(div);
toastDiv = $('#toast-js');

function toast(msg, type, seconds){
    seconds = typeof seconds !== 'undefined' ? seconds : 3;
    type = typeof type !== 'undefined' ? type : 'warning';
    toastDiv.removeClass().addClass(type);

    var p = toastDiv.children();
    p.text(msg);
    toastDiv.fadeIn(400).delay(seconds * 1000).fadeOut(400);
}
