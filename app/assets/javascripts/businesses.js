// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

 // For searching businesses on index
$(function() {
  $("#businesses th a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#businesses_search input").keyup(function() {
    $.get($("#businesses_search").attr("action"), $("#businesses_search").serialize(), null, "script");
    return false;
  });
});

/*onLoad(function() {
    window.fbAsyncInit = function() {
        FB.init({
          appId      : '467842340019517',
          xfbml      : true,
          version    : 'v2.1'
        });
    };
    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk')
    );    
});*/
