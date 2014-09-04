# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
