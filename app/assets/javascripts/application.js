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
//= require turbolinks
//= require jquery/dist/jquery.min
//= require popper.min
//= require bootstrap/dist/js/bootstrap.min
//= require holder.min
//= require lightgallery/dist/js/lightgallery.min
//= require lg-thumbnail/dist/lg-thumbnail.min
//= require lg-fullscreen/dist/lg-fullscreen.min
//= require_tree .
//= require_self

$(document).ready(function() {
  $("#lightgallery").lightGallery({
    selector: '.card'
  });
});
