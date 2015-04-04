
sendMessage = ->
  msg = $("#message").val()
  console.log msg
  now = new Date()
  Messages.insert {text: msg, datetime: now, userId: Meteor.userId() }
  $('#message').val('')

Template.inputbox.events
  'focus #message': (evt, template) ->
    Session.set('inputFocused', true)
  'blur #message': (evt, template) ->
    Session.set('inputFocused', false)
  'click #btnSend': sendMessage

Template.inputbox.helpers = ->
  inputFocused: -> (Session.get('inputFocused')) ? 'is-focused' : 'not-focused'

Template.inputbox.rendered = ->
  Session.set('inputFocused', 'false')
  $('#message').autogrow()
