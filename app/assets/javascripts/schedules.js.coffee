$(document).ready () ->
        ddl = $('select#timeslot_date')
        cal = $('#cal')
        $('select#schedule_domain_id').change () ->
                id_value_string = $(this).val();
                $.ajax
                  dataType: "json"
                  cache: false
                  url: "/schedules/" + id_value_string + "/timeslot_to_display"
                  timeout: 2000
                  error: (XMLHttpRequest, errorTextStatus, error) ->
                    alert "Failed to submit : " + errorTextStatus + " ;" + error

                  success: (data) ->
                        #ddl.html("")
                        cal = $('#cal')
                        cal.html("")    
                        console.log(data)

                        $.each data, (i, j) ->
                                console.log("I am i" + i)
                                createDiv(i, cal)
                                console.log(j)
                                #createOption(ddl, j.date, j.date)
                                $.each j, (x, y) ->
                                        console.log("I am x" + x)
                                        console.log(y)                                        
                                        console.log("I am i in second loop still vis" + i)
                                        fid = "#" + i
                                        box = $(fid)
                                        console.log(fid)                                                                        
                                        createRadioButtonTag(box, y.id, "timeslot", y.start_time)




        createOption = (ddl, text, value) ->
                opt = document.createElement("option")
                opt.value = value
                opt.text = text
                ddl.append(opt)

        createRadioButtonTag = ( box, value, name, label) ->

                radioInput = '<input type="radio" name="' + name + ' value="' + value + '">'
                labelSection = document.createElement("label")
                labelSection.setAttribute "class", "radio"
                time = new Date(label)
                formatted_time = formatTime(time)
                labelSection.innerHTML = radioInput + formatted_time 
                box.append(labelSection)

        createDiv = (i, cal) ->
                d = document.createElement("div")
                d.setAttribute "class", "span2 calendar-date"
                d.setAttribute "id", i
                d.textContent = i
                cal.append(d)

        formatTime = (time) ->
                curr_hour = time.getUTCHours()
                if curr_hour < 12
                  a_p = " am"
                else
                  a_p = " pm"
                curr_hour = 12  if curr_hour is 0
                curr_hour = curr_hour - 12  if curr_hour > 12
                curr_min = time.getUTCMinutes()
                curr_min = curr_min + ""
                curr_min = "0" + curr_min  if curr_min.length is 1
                return curr_hour + ":" + curr_min + a_p