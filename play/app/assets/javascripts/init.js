    // Semicolon (;) to ensure closing of earlier scripting
    // Encapsulation
    // $ is assigned to jQuery
    ;(function($) {

         // DOM Ready
        $(function() {

            // Binding a click event
            // From jQuery v.1.7.0 use .on() instead of .bind()
            $('#sign-up-pop-up').bind('click', function(e) {

                // Prevents the default action to be triggered. 
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#sign-up-element-to-pop-up').bPopup();

            });

            $('#sign-in-pop-up').bind('click', function(e) {

                // Prevents the default action to be triggered. 
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#sign-in-element-to-pop-up').bPopup();

            });

        });

    })(jQuery);


// ------- Responsive Nav -------- //

$(document).on('page:load', function() {
    // turbolinks fix
});

jQuery(document).ready(function(jQuery) {
    $('#menu').slicknav({
    label: '',
    duration: 250,
    easingOpen: "swing",
    brand: '<div class="logo">BettingForge</div>'
});
  // var nav = responsiveNav(".nav-collapse", { // Selector
  //       animate: true, // Boolean: Use CSS3 transitions, true or false
  //       transition: 284, // Integer: Speed of the transition, in milliseconds
  //       label: "Menu", // String: Label for the navigation toggle
  //       insert: "before", // String: Insert the toggle before or after the navigation
  //       customToggle: "ninja-btn", // Selector: Specify the ID of a custom toggle
  //       closeOnNavClick: false, // Boolean: Close the navigation when one of the links are clicked
  //       openPos: "relative", // String: Position of the opened nav, relative or static
  //       navClass: "nav-collapse", // String: Default CSS class. If changed, you need to edit the CSS too!
  //       navActiveClass: "js-nav-active", // String: Class that is added to  element when nav is active
  //       jsClass: "js", // String: 'JS enabled' class which is added to  element
  //       init: function(){}, // Function: Init callback
  //       open: function(){}, // Function: Open callback
  //       close: function(){} // Function: Close callback
  // });
});

// ------ Slider -------- //
$(document).ready(function(){
  $('.bxslider').bxSlider({
    slideMargin: '0',
    responsive: true,
    auto: false,
    pause: 3200
  });
});


// ------- Profile progress bar -------- //
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