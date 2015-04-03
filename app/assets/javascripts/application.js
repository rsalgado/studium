// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.pjax
//= require summernote

//= require_tree .


$(function() {
  // Use PJAX to reload only a part of the site and keep the scroll in the same place
  // NOTE: Consider doing the same with Turbolinks
  $(document).pjax('#section-contents a:not(a[data-method])', '#section-contents');   // Listens to all links without the data-method attribute (to avoid triggering PJAX when deleting items, which caused Errors)
  $.pjax.defaults.scrollTo = false;
});