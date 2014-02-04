// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on("page:change", function() {
  var original_answer = $('#questions-list').find('.original-answer');
  original_answer.find('p').toggleClass('hidden');
  
  original_answer.on('click', function () {
    $(this).find('h4').toggleClass('hidden');
    $(this).find('p').toggleClass('hidden');
  });

  // 'Done' button functionality
  $('#questions-list').find('.done').on('click', function() {
    $(this).closest('.panel').toggleClass('panel-default')
                             .toggleClass('panel-success');
    $(this).closest('.panel').find('.panel-collapse').collapse('toggle');
  });

  $('#questions-list').find('.reset').on('click', function() {
    $(this).closest('.panel').find('.test-answer').val('');
  });
});
