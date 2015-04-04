
@NexmoMessages = new Mongo.Collection 'nexmo_messages'


Meteor.methods
  'receive_sms': (values) ->
    console.log values

if nexmo_callback_secret?
  Router.route '/receive-sms-' + nexmo_callback_secret, ->
    sms_data = @request.query
    console.log sms_data
    NexmoMessages.insert sms_data
    Messages.insert
      text: sms_data.text
      datetime: new Date()
    @response.end JSON.stringify sms_data
  ,
    where: 'server'
else
  console.log 'nexmo callback secret not defined'
