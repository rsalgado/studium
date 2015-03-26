$(document).on("page:change pjax:success", function() {
  
  // Tests' Tab Functionality

  // 'Original Answer' functionality
  $('#questions-list').find('.original-answer').on('click', function() {
    $(this).toggleClass("show-answer");
  });

  // 'Done!' button functionality
  $('#questions-list').find('.done').on('click', function() {
    var panel = $(this).closest('.panel');
    // Change panel color from default to success and collapse it
    panel.toggleClass('panel-default').toggleClass('panel-success');
    panel.find('.panel-collapse').collapse('toggle');
  });

  // 'Reset' button functionality
  $('#questions-list').find('.reset').on('click', function() {
    var panel = $(this).closest(".panel");
    // Clear the answer, hide the original answer and toggle panel success (Done!) styles
    panel.find('.test-answer').val('');
    panel.find('.original-answer').removeClass("show-answer");
    panel.addClass('panel-default').removeClass('panel-success');
  });


  // Notes' Tab functionaliy
  // Summernote code

  var notes = $('#summernote');    // shorthand to avoid repeated search
  // Initialization
  notes.summernote({
    // Retrieve code from textarea
    oninit: function() { notes.code( notes.val() ); },
    // Set other options, like height and the elements of the toolbar
    height: 240,
    toolbar: [
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['help', ['help']]
    ]
  });
  // Before sending get the code and put it back to the textarea
  notes.closest('form').submit(function() {   notes.val( notes.code() ); });
});