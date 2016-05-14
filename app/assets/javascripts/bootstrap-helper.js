$(document).ready(function() {
  // fetchAvailability();
    // need to make sure that the calendar is rendered AFTER the fetchAvailability function returns
    // in $.ajax({success()}), call the renderCalendar function and feed it the return value (aka blackout dates)
  renderCalendar();
});

function renderCalendar() {
  $('#home-date-range').daterangepicker({
    "autoApply": true,
    "startDate": getFormattedDate(),
    "endDate": getFormattedDate(),
    "minDate": getFormattedDate()
  });

  bindCalendarEvents();
}

function bindCalendarEvents() {
  $('.date-picker-box button').on('click', function(event) {
    event.preventDefault();
    var dates     = $(event.target).siblings().val().split(' - ');
    var startDate = new Date(dates[0]);
    var endDate   = new Date(dates[1])

    var pathElements = window.location.pathname.split("/")
    var homeId = pathElements[pathElements.length - 1]
    var data   = {
                    data: {
                            startDate: startDate,
                            endDate: endDate,
                            homeId: homeId
                          }
                  };

    $.ajax({
      method:   "POST",
      dataType: "json",
      url:      "/api/v1/reservations",
      data:     data,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(data) {
        window.location.href = "/cart"

        // if (data.redirect) {
        //     // data.redirect contains the string URL to redirect to
        //     window.location.href = data.redirect;
        // }
        // else {
        //     // data.form contains the HTML for the replacement form
        //     $("#myform").replaceWith(data.form);
        // }

        // $('.navbar-right li:last-child').click()
        // successmessage = 'Data was succesfully captured';
        // $("label#successmessage").text(successmessage);
      }, error: function(xhr) {
        alert("Something went wrong :(")
      }
    });
  });
}

function getFormattedDate() {
  var fullDate = new Date()
  var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  var currentDate = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
  return currentDate
}
