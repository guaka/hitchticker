
@NexmoMessages = new Mongo.Collection 'nexmo_messages'


Meteor.methods
  'receive_sms': (values) ->
    console.log values

if nexmo_callback_secret?
  Router.route '/receive-sms-' + nexmo_callback_secret, ->
    smsData = @request.query
    console.log smsData
    NexmoMessages.insert smsData
    Messages.insert
      text: smsData.text
      datetime: new Date()
      smsId: smsData.messageId
    @response.end JSON.stringify smsData
  ,
    where: 'server'
else
  console.log 'nexmo callback secret not defined'
