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
//= require activestorage
//= require turbolinks
//= require simplemde.min
//= require_tree .

function closeNotification(){
  var notifications = Array.from(document.getElementsByClassName('notification'));
  notifications.forEach(function (item) {
    item.remove(item.selectedIndex);
  })
}

window.onload = function () {
  var typed = new Typed("#home-description", {
    strings: ['Soy Ingeniero Informático', 'Desarrollador Web', 'Fan del Chelsea F.C', "I'm a Software Engineer",  "Chelsea F.C fan", "Web Developer"],
    typeSpeed: 20
  })
}