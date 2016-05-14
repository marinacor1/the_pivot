$(document).ready(function() {
  renderCalendar();
});

function renderCalendar() {
  $('#home-date-range').daterangepicker({
    "autoApply": true,
    "startDate": getFormattedDate(),
    "endDate": getFormattedDate(),
    "minDate": getFormattedDate()
  }, function(start, end, label) {
     console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
  })
}

function getFormattedDate() {
  var fullDate = new Date()
  var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
  var currentDate = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
  return currentDate
}
