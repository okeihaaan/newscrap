$(function() {
    var h = $(window).height();

    $('#content').css('display', 'none');
    $('#loading').height(h).css('display', 'block');
});

$(window).load(function() { 
    $('#loading').delay(1000).fadeOut(800);
    $('#content').css('display', 'block');
});


$(signIn).onclick(function(){
    javascript:window.open('about:blank','_self').close();
})