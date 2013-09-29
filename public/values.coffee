$(document).ready () ->
  messages = []
  socket = io.connect("http://localhost:3700")

  socket.on "message", (data) ->
    if data.message
      $(".table").prepend("<tr><td>" + data.message +  "</td></tr>")
