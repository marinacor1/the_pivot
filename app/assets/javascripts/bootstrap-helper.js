$(document).ready(function() {
  renderCalendar();

});

function renderCalendar() {
  $('#home-date-range').daterangepicker({
    "autoApply": true,
    "startDate": getFormattedDate(),
    "endDate": getFormattedDate(),
    "minDate": getFormattedDate(),
    "isInvalidDate": function(date) {
      for (var ii = 0; ii < some_date_range.length; ii++) {
      if (date.format('DD-MM-YYYY') == some_date_range[ii]) {
        return true;
      }
    }
  }})
}

function getFormattedDate() {
  var fullDate = new Date()
  var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  var currentDate = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
  return currentDate
}

var some_date_range = [
 '02-06-2016',
 '03-06-2016',
 '04-06-2016',
 '05-06-2016'
];
