# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@teste = () -> $.get("/interface/data").done (data) -> $("#texto").text(data.texto)

@scan = () -> $.get("/interface/scan", {code: $("#input-code").val()}).done (data) -> console.log data.msg
