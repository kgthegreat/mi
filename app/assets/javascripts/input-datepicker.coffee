$(document).ready () ->
  $("input.date_picker").datepicker({ 
    dateFormat: "dd-mm-yy", 
    changeYear: true
  });
