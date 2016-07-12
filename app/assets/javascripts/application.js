// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function(){

  $('[data-next-panel]').on('click', function(){
    var $panel = $(this).closest('.panel');
    var errors_found = false;

    $('[data-required]', $panel).find('input, select').each(function(){

      if (this.value=='') {
        $(this).closest('.field').addClass('field_with_errors')
        errors_found = true;
        console.log('errors', this)
      } else {
       $(this).closest('.field').removeClass('field_with_errors')
      }
    });
    if (errors_found) {
     // alert('Fill in the fields')
   } else {
    $panel.removeClass('current_panel').next('.panel').addClass('current_panel');
    $('.current_panel').trigger('current_panel').find('input,select,textarea').first().trigger('focus')
  }
});

  $('form').on('submit', function(e){
    if (hasNextPanel()) {
      $('.current_panel [data-next-panel]').trigger('click')
      return false;
    }
  });


  function hasNextPanel() {
    return !$('.panel').last().hasClass('current_panel');
  }



$('.summary_panel').on('current_panel', generateSummary);

var summary_row_template = `<tr>
  <th></th>
  <td></td>
</tr>`;

function generateSummary() {
  $summary_table = $('table.summary_table');
  console.log($summary_table)
  $summary_table.empty();
  $('[data-summary]').each(function(){
    var key = $(this).data('summary')
    var value = $(this).find('input').val()
    $row = $(summary_row_template);
    $('th', $row).html(key)
    $('td', $row).html(value)
    $summary_table.append($row)

  });
}

  $('[data-prev-panel]').on('click', function(){
    $prev = $('.current_panel').prev('.panel')
    if ($prev.length > 0) {
      $('.current_panel').removeClass('current_panel')
      $prev.addClass('current_panel')
    }
  })

});