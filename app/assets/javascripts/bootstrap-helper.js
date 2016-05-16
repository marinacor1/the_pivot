$(document).ready(function() {
  renderCalendar();
});

function getFormattedDate() {
  var fullDate      = new Date()
  var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  var currentDate   = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
  return currentDate
}

function renderCalendar() {
    $('#home-date-range').daterangepicker({
      "autoApply": true,
      "startDate": getFormattedDate(),
      "endDate": getFormattedDate(),
      "minDate": getFormattedDate()
    })
    bindCalendarEvents();
}

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
