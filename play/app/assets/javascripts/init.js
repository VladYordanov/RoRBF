/*------------------------------------------------------------------*\
  Popup initialization
\*------------------------------------------------------------------*/
;(function($) {

    $(function() {
        $('#sign-up-pop-up').bind('click', function(e) {
            e.preventDefault();
            $('#sign-up-element-to-pop-up').bPopup();
        });

        $('#sign-in-pop-up').bind('click', function(e) {
            e.preventDefault();
            $('#sign-in-element-to-pop-up').bPopup();
        });
    });

})(jQuery);

/*------------------------------------------------------------------*\
  Turbolinks fix
\*------------------------------------------------------------------*/
$(document).on('page:load', function() {});

/*------------------------------------------------------------------*\
Responsive Nav
\*------------------------------------------------------------------*/
jQuery(document).ready(function(jQuery) {
    $('#menu').slicknav({
      label: '',
      duration: 250,
      easingOpen: "swing",
      brand: '<div class="logo">BettingForge</div>'
    });
});

/*------------------------------------------------------------------*\
  Slider
\*------------------------------------------------------------------*/
$(document).ready(function(){
  $('.bxslider').bxSlider({
    slideMargin: '0',
    responsive: true,
    auto: false,
    pause: 3200
  });
});

/*------------------------------------------------------------------*\
  Profile progress bar
\*------------------------------------------------------------------*/
$(function(){
  var $ppc = $('.progress-pie-chart'),
    percent = parseInt($ppc.data('percent')),
    deg = 360*percent/100;
  if (percent > 50) {
    $ppc.addClass('gt-50');
  }
  $('.ppc-progress-fill').css('transform','rotate('+ deg +'deg)');
  $('.ppc-percents span').html(percent+'%');
});
