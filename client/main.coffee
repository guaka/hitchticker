
sendMessage = ->
  msg = $("#message").val()
  console.log msg
  Messages.insert {text: msg}
  $('#message').val('')


Template.inputbox.events
  'keypress input': (evt, template) ->
    if evt.which is 13
      sendMessage()
  'click #btnSend': sendMessage



Template.ticks.helpers
  messages: Messages.find {}
