$(document).ready(function() {
  renderCalendar();
  // confirmReservation();
});

function getFormattedDate() {
  var fullDate      = new Date()
  var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  var currentDate   = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
  return currentDate
}

function renderCalendar() {
  // InvalidDates.getDates(function(invalidDates) {
    $('#home-date-range').daterangepicker({
      "autoApply": true,
      "startDate": getFormattedDate(),
      "endDate": getFormattedDate(),
      "minDate": getFormattedDate(),
    //   "isInvalidDate": function(date) {
    //     for (var ii = 0; ii < invalidDates.length; ii++) {
    //     if (date.format('MM-DD-YYYY') == invalidDates[ii]) {
    //       return true;
    //     }
    //   }
    // }
    })

    // Create Reservations (post to api/v1/reservations)
    bindCalendarEvents();
  // });
}

// var reservationCount = 0;
function bindCalendarEvents() {
  $('.date-picker-box button').on('click', function(event) {
    event.preventDefault();
    var dates    = $(event.target).siblings().val().split(' - ');
    var checkIn  = new Date(dates[0]);
    var checkOut = new Date(dates[1])

    var pathElements = window.location.pathname.split("/")
    var homeId = pathElements[pathElements.length - 1]
    var data   = {
                    data: {
                            checkIn:  checkIn,
                            checkOut: checkOut,
                            homeId:   homeId
                          }
                 };

    // reservationCount += 1
    // // change button id/color/text to 'Reserved!'
    // if (reservationCount > 1) { return }

    $.ajax({
      method:   "POST",
      dataType: "json",
      url:      "/api/v1/carts",
      data:     data,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(data) {
        var cartSum = Object.keys(data.contents).length
        $('#cart-count').text(cartSum);
      }, error: function(xhr) {
           alert("Reservation failed! Please try again.")
        }
      });
    });
}

InvalidDates = {
    getDates: function(callback) {
      $.ajax({
            method:   "GET",
            dataType: "json",
            url:      "/reservations/pending",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            success: function(data) {
              callback.call(this,data);
            }, error: function(xhr) {
              alert("Something went wrong with Invalid Dates")
            }
      });
     }
}
