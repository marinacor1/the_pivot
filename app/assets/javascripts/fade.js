$(document).ready(function() {
  $('#application-window').css('display', 'none');
  $('#application-window').fadeIn(750);

  $('.link').click(function() {
    event.preventDefault();
    newLocation = this.href;
    $('#application-window').fadeOut(500, newpage);
  });

  function newpage() {
    window.location = newLocation;
  }
});
