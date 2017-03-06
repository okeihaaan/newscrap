$(function() {
    var h = $(window).height();

    $('#content').css('display', 'none');
    $('#loading').height(h).css('display', 'block');
});

$(window).load(function() { 
    $('#loading').delay(1000).fadeOut(800);
    $('#content').css('display', 'block');
});

$(function() {
    $("#datepicker").datepicker();
    $("#datepicker").datepicker("option", "showOn", 'button');
    $("#datepicker").datepicker("option", "buttonImageOnly", true);
    $("#datepicker").datepicker("option", "buttonImage", 'ico_calendar.png');
  });

$(signIn).onclick(function(){
    javascript:window.open('about:blank','_self').close();
})