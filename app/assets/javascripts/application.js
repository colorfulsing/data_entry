// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
// require turbolinks
//= require ./jquery/jquery-3.3.1.min.js
//= require ./jquery/jquery-ui.min.js
//= require ./popper/popper.min.js
//= require ./bootstrap/bootstrap.min.js
// require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require_tree .

// Fixed alert events
(function () {
  $('.fixed-alert .alert .close-alert-trigger').click(function (e) {
    var myself = $(e.target);
    var parent = myself.closest('.alert');
    parent.remove();
  });
})();

// Autocomplete events
(function(){
  // Add edit trigger event
  $('form .trigger-edit').click(function(e) {
    var myself = $(e.target);
    var container = myself.closest('.form-group');
    container.toggleClass('read-only');
  });
})();
function configAutocomplete(options) {
  // Get parameters
  if (typeof(options) === 'undefined')
    options = {};
  var opts = $.extend({
    queryInputSelector: null,
    valueInputSelector: null,
    minLength: 2,
    source: null
  }, options);

  // Config autocomplete
  var queryInput = $(opts.queryInputSelector);
  var valueInput = $(opts.valueInputSelector);
  var inputContainer = queryInput.closest('.form-group');
  var readonlyLabel = inputContainer.find('.item-name .text');
  var autocomplete = $(queryInput).autocomplete({
    minLength: opts.minLength,
    source: opts.source,
    select: function(event, ui) {
      var id = ui.item.id;
      var text = ui.item.nombre;
      valueInput.val(id);
      queryInput.val(text);
      readonlyLabel.text(text);
      inputContainer.toggleClass('read-only');
      return false;
    } /*,
    focus: function(event, ui) {
      var name = ui.item.name;
      queryInput.val(name);

    }*/
  }).autocomplete("instance")._renderItem = function(ul, item) {
    // Build autocomplete render function
    var container = $('<li>');
    var link = $('<a>');
    var title = $('<span>');

    // Create template
    container.addClass('autocomplete-item');
    link
      .attr('href', 'javascript:void(0);')
      .appendTo(container);
    title
      .addClass('title')
      .text(item.nombre)
      .appendTo(link);

    // Add all data to template
    for(var i = 0; i < item.data.length; i ++) {
      var dataItem = item.data[i];
      var dataTag = $('<span>');
      dataTag
        .addClass('data')
        .text(dataItem.value)
        .appendTo(link);
    }

    // Append item to result link
    return container.appendTo(ul);
  }
}
