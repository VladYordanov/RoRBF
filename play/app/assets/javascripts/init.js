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


// Responsive Nav

$(document).on('page:load', function() {
    // turbolinks fix
});

jQuery(document).ready(function(jQuery) {
  var nav = responsiveNav(".nav-collapse", { // Selector
        animate: true, // Boolean: Use CSS3 transitions, true or false
        transition: 284, // Integer: Speed of the transition, in milliseconds
        label: "Menu", // String: Label for the navigation toggle
        insert: "before", // String: Insert the toggle before or after the navigation
        customToggle: "ninja-btn", // Selector: Specify the ID of a custom toggle
        closeOnNavClick: false, // Boolean: Close the navigation when one of the links are clicked
        openPos: "relative", // String: Position of the opened nav, relative or static
        navClass: "nav-collapse", // String: Default CSS class. If changed, you need to edit the CSS too!
        navActiveClass: "js-nav-active", // String: Class that is added to  element when nav is active
        jsClass: "js", // String: 'JS enabled' class which is added to  element
        init: function(){}, // Function: Init callback
        open: function(){}, // Function: Open callback
        close: function(){} // Function: Close callback
  });
});

// SLider
$(document).ready(function(){
  $('.bxslider').bxSlider({
    slideMargin: '0',
   // auto: true,
    pause: 3200
  });
});