$(document).ready () ->
        ddl = $('select#timeslot_date')

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
                    ddl.html("")
                    console.log(data)
                    $.each data, (i, j) ->
                        createOption(ddl, j.date, j.date)



        createOption = (ddl, text, value) ->
            opt = document.createElement("option")
            opt.value = value
            opt.text = text
            ddl.append(opt)