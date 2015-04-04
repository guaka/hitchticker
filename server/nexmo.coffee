
@NexmoMessages = new Mongo.Collection 'nexmo_messages'


Meteor.methods
  'receive_sms': (values) ->
    console.log values



Router.route '/receive-sms-' + nexmo_callback_secret, ->
  # TODO: https://github.com/Nexmo/Quickstarts/blob/master/sms/receive/php/receive.php

  # NodeJS objects
  # console.log @request
  sms_data = @request.query
  console.log sms_data
  NexmoMessages.insert sms_data
  Messages.insert
    text: sms_data.text
    dateime: new Date()
  @response.end JSON.stringify sms_data
,
  where: 'server'
