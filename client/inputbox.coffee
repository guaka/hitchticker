
sendMessage = ->
  msg = $("#message").val()
  console.log msg
  now = new Date()
  Messages.insert {text: msg, datetime: now, userId: Meteor.userId() }
  $('#message').val ''

Template.inputbox.events
  'focus #message': (evt, template) ->
    inputFocused = true
  'blur #message': (evt, template) ->
    inputFocused = false
  'click #btnSend': sendMessage

Template.inputbox.rendered = ->
  $('#message').autogrow()

