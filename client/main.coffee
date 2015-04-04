
#
# Inputbox
#
sendMessage = ->
  msg = $("#message").val()
  console.log msg
  now = new Date()
  Messages.insert {text: msg, datetime: now, userId: Meteor.userId() }
  $('#message').val('')

Template.inputbox.events
  'focus #message': (evt, template) ->
    inputFocused = true
  'blur #message': (evt, template) ->
    inputFocused = false
  'keypress #message': (evt, template) ->
    console.log messageCharsLeft
    #@messageCharsLeft = $('#message').val().length + 1
    #if evt.which is 13
    #  sendMessage()
  'click #btnSend': sendMessage

Template.inputbox.helpers
  inputFocused: false
  messageCharsLimit: 500
  #messageCharsLeft: @messageCharsLimit

Template.inputbox.rendered = ->
  $('#message').autogrow()



#
# Ticks
#
Template.ticks.helpers
  messages: Messages.find {}, {sort: {datetime: -1}}
  prettyTime: (t) -> moment(t).format 'YYYY-MM-DD H:mm:ss'
  userName: (id) -> 'Anonymous'#Meteor.users.findOne(id)?.username
  #userEmail: (id) -> Meteor.users.findOne(id)?.emails?[0]?.address
  gravatar: () -> 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='

