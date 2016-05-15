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
  InvalidDates.getDates(function(invalidDates) {
    $('#home-date-range').daterangepicker({
      "autoApply": true,
      "startDate": getFormattedDate(),
      "endDate": getFormattedDate(),
      "minDate": getFormattedDate(),
      "isInvalidDate": function(date) {
        for (var ii = 0; ii < invalidDates.length; ii++) {
        if (date.format('MM-DD-YYYY') == invalidDates[ii]) {
          return true;
        }
      }
    }})

    // Create Reservations (post to api/v1/reservations)
    bindCalendarEvents();
  });
}

var reservationCount = 0;
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
                            endDate:   endDate,
                            homeId:    homeId
                          }
                 };
    reservationCount += 1
    if (reservationCount > 1) { return }

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

// function confirmReservation() {
//   $('#reserve-days').on('click', function() {
//     $('#lets-go').empty();
//     $('#lets-go').append("<button class='btn btn-danger' id='trip-ready'>Let's Go!</button>");
//   })
//   addReservationToCart();
// }

// function addReservationToCart() {
//   var pathElements = window.location.pathname.split("/")
//   var homeId = pathElements[pathElements.length - 1]
//   var data   = {
//                   data: {
//                           homeId: homeId
//                         }
//                };
//
//   $('#trip-ready').on('click', function() {
//     $.ajax({
//       method:   "POST",
//       dataType: "json",
//       url:      "/api/v1/carts",
//       data:     data,
//       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//       success: function(data) {
//         var cartSum = Object.keys(data.contents).length
//         $('#cart-count').text(cartSum);
//         }, error: function(xhr) {
//           alert("Something went wrong :(")
//         }
//       });
//     });
// }

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
              alert("Something went wrong :(")
            }
      });
     }
}
