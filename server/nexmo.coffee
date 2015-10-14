
# This is only on the server
@NexmoMessages = new Mongo.Collection 'nexmo_messages'


if nexmo_callback_secret?  # This is defined in server/lib/secrets.coffee
  Router.route '/receive-sms-' + nexmo_callback_secret, ->
    smsData = @request.query
    console.log smsData
    if smsData.text.startsWith 'verify'
      console.log '@todo: verify account here'
    else
      NexmoMessages.insert smsData
      Messages.insert
        text: smsData.text
        datetime: new Date()
        smsId: smsData.messageId
    @response.end JSON.stringify smsData
  ,
    where: 'server'
else
  console.log 'SMS feature disabled. Define nexmo_callback_secret in server/lib/secrets.coffee if you want to receive text messages.'
