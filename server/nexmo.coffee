

Meteor.methods
  'receive_sms': (values) ->
    console.log values



Router.route '/receive_sms/:data', ->
  # NodeJS objects
  # console.log @request
  console.log @response
  
  @response.end 'file download content\n'
,
  where: 'server'
