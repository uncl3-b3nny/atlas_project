# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
    var $tr = $(link).closest('tr');
    return $(content).insertBefore($tr);
  }
}