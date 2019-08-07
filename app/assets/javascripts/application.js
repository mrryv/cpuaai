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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function toggleNav() {
  var nav = document.getElementById("mySidenav");
  var ps = $("#mySidenav .nav-link p, #mySidenav .brand-link span")
  console.log(nav.style.width);
  if(nav.style.width == "" || nav.style.width == "75px") {
    nav.style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    ps.addClass("d-inline").removeClass("d-none")
  } else {
    nav.style.width = "75px";
    document.getElementById("main").style.marginLeft = "75px";
    ps.addClass("d-none").removeClass("d-inline")
  }
}
