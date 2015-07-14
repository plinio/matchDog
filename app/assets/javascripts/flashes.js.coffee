show_ajax_message = (msg, type) ->
  if (type == "error")
    $("#flash-message").html "<div id='flash-#{type}' class='alert alert-danger'>#{msg}</div>"
  else if (type == "success")
    $("#flash-message").html "<div id='flash-#{type}' class='alert alert-success'>#{msg}</div>"
  else if (type == "notice")
    $("#flash-message").html "<div id='flash-#{type}' class='alert alert-info'>#{msg}</div>"  
  else if (type == "warning")
    $("#flash-message").html "<div id='flash-#{type}' class='alert alert-warning'>#{msg}</div>"
  $("#flash-#{type}").delay(3000).slideUp(500)

$(document).ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  type = request.getResponseHeader("X-Message-Type")
  show_ajax_message msg, type