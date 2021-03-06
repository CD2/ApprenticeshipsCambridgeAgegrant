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
//= require jquery-ui
//= require_tree .

$(function(){

  $.rails.enableFormElements($($.rails.formSubmitSelector));
  $('.no_js_hidden').removeClass('no_js_hidden')
  $('.current_panel:not(:first-of-type)').removeClass('current_panel')


  formsubmitted = false;

  $('form.grant_form').on('submit', function(e){
    if (hasNextPanel()) {
      nextPanel();
      return false;
    }
    formsubmitted = true;
  });

  function hasNextPanel() {
    return !$('.panel').last().hasClass('current_panel');
  }

  function nextPanel(){
    var $panel = $('.current_panel').closest('.panel');
    var errors_found = false;

    $('[data-required]', $panel).find('input[name], select, textarea').each(function(){

      if (this.value=='' || (this.type == 'checkbox' && !$(this).is(':checked'))) {
        $(this).closest('.field').addClass('field_with_errors')
        errors_found = true;
      } else {
       $(this).closest('.field').removeClass('field_with_errors')
          .find('span.has_errors').removeClass('has_errors')
          .end().find('span.error_explanation').remove()
      }
    });
    $('[data-min-length]', $panel).each(function(){
      if ($(this).find('input').val().length < 6) {
        errors_found = true
        $(this).addClass('field_with_errors')
      } else {
        $(this).removeClass('field_with_errors')
      }
    });

    $pass = $('input[type=password]#grant_detail_password', $panel);
    $pass_conf = $('input[type=password]#grant_detail_password_confirmation', $panel);

    if ($pass.length>0) {
      if ($pass.val() != $pass_conf.val()) {
        errors_found = true
        $pass_conf.closest('.field').addClass('field_with_errors')
      } else if ($pass.val().length > 0) {
        $pass_conf.closest('.field').removeClass('field_with_errors')
          .find('span.has_errors').removeClass('has_errors')
          .end().find('span.error_explanation').remove()
      }
    }

    if (errors_found == false) {
      $panel.removeClass('current_panel').next('.panel').addClass('current_panel');
      $('.current_panel').trigger('current_panel').find('input,select,textarea').first().trigger('focus')
      generateSummary()
      $.rails.enableFormElements($($.rails.formSubmitSelector));
      var index = $('.panel').index($panel) + 1;
      $('.searchform__step').removeClass('searchform__step--current').eq(index).addClass('searchform__step--current');
    }
  };


  var summary_row_template = '<tr><th></th><td></td></tr>';

  window.generateSummary = function() {
    $summary_table = $('table.summary_table');
    $summary_table.empty();
    $('[data-summary]').each(function(){
      var key = $(this).data('summary')
      var value = $(this).find('input,select,textarea').val()
      if ($(this).find('input,select,textarea').is('select') && value=='-1') value = "My training provider is not listed"
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
  });


  if ($('form.grant_form').length > 0) {
    $(window).on('beforeunload', function(e){
      if (formsubmitted) return undefined;
      var message = 'Leaving this page will reset the form and all infomation will be lost.';
      (e || window.event).returnValue = message; //Gecko + IE
      return message;
    });
  }


  $('.start_date').datepicker({
      dateFormat: 'dd/mm/yy',
      minDate: '01/08/2016',
      changeMonth: true,
      changeYear: true
  });

});



$(function(){
  if (!Cookies.get('cookie_policy_acceptance')) {
    cookie_html = '<div id="cookie_policy_popup"><div id="cookie_policy_popup_close">&#10005;</div>This site uses cookies to enhance user experience.</div>';
    $("body").append($(cookie_html));
    $('#cookie_policy_popup_close').on('click', function(){
      $('#cookie_policy_popup').remove();
      Cookies.set('cookie_policy_acceptance', 1);
    });
  }


  $('[data-trade-supplier-select]').on('change', function(){
    var text = $(this).find('option:selected').text();
    if (text=='Other') {
      $(this).closest('.field').next().show().find('input').val('')
    } else {
      $(this).closest('.field').next().hide().find('input').val(text)
    }
  });

  (function(){

    txt = $('[data-trade-supplier-select]').find('option:selected').text();
    if (txt=='Other') {
      $(this).closest('.field').next().show()
    } else {
      $(this).closest('.field').next().hide()
    }

  })();

});


$(window).on('load', function(){
  $('.summary_panel').on('current_panel', function(){
    window.generateSummary()
  });
});
