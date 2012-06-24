$(document).ready () ->
  $("input.time_picker").timePicker({ 
    startTime: "02.00"
    endTime: new Date(0, 0, 0, 15, 30, 0)
    show24Hours: false
    separator: '.'
    step: 15
  });

 
  $("#time3, #time4").timePicker({
   show24Hours: false 
  })
  oldTime = $.timePicker("#time3").getTime()
  $("#time3").change ->
    if $("#time4").val()
      duration = ($.timePicker("#time4").getTime() - oldTime)
      time = $.timePicker("#time3").getTime()
      $.timePicker("#time4").setTime new Date(new Date(time.getTime() + duration))
      oldTime = time

  $("#time4").change ->
    if $.timePicker("#time3").getTime() > $.timePicker(this).getTime()
      $(this).addClass "error"
    else
      $(this).removeClass "error"