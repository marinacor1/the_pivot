$(document).ready(function() {
  renderCalendar();
  confirmReservation();
});

function confirmReservation() {
  someAjaxFunctionCall()
  $('#submit').on('click', function() {
    $('#lets-go').empty();
    $('#lets-go').append("<div><button class='btn btn-danger' id='trip-ready'>Let's Go!</button></div>");
  })
}

function someAjaxFunctionCall() {
  // Adds reservation to Cart / takes you to cart (via controller)
  // $.ajax
}

function renderCalendar() {
  // let some_date_range = invalidDatesAjax();
  $('#home-date-range').daterangepicker({
    "autoApply": true,
    "startDate": getFormattedDate(),
    "endDate": getFormattedDate(),
    "minDate": getFormattedDate(),
    "isInvalidDate": function(date) {
      for (var ii = 0; ii < some_date_range.length; ii++) {
      if (date.format('MM-DD-YYYY') == some_date_range[ii]) {
        return true;
      }
    }
  }})

  bindCalendarEvents();
  // ajax call to create Reservation (post to api/v1/reservations)
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
        console.log("Whatever");
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

var some_date_range = [
 '06-02-2016',
 '06-03-2016',
 '06-04-2016',
 '06-05-2016',
];
