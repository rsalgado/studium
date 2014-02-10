// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on("page:change pjax:success", function() {
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


  // Summernote code

  // shorthand to avoid repeated search
  var notes = $('#summernote');
  // Initialization
  notes.summernote({
    // Retrieve code from textarea
    oninit: function() {
      notes.code( notes.val() );
    },
    // Set other options, like height and the elements of the toolbar
    height: 240,
    toolbar: [
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['help', ['help']]
    ]
  });

  // Before sending get the code and put it back to the textarea
  notes.closest('form').submit(function(){
    notes.val( notes.code() );
  });

  /* 
  * TODO: See if there are better ways of achieving the same without having 
  * to do jQuery hacks or consider using AJAX forms, instead.
  */
});
