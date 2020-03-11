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
//= require leaflet
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/datepicker
//= require bootstrap
//= require activestorage
//= require_tree .


$(document).ready(function() {
    $('.collapsible').click(function(){
        $(this).next().hasClass('collapse-table') ? $(this).next().removeClass('collapse-table') : $(this).next().addClass('collapse-table')
    })
})

$('.alert').alert()

$('#committee-primer button a').click(function(){
    $(this).next('ul').slideToggle('500');
    $(this).find('i').toggleClass('fa-toggle-on fa-toggle-off')
});