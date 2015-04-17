
Template.phoneconnector.helpers
  inboundNumber: '+491771789420'
  phonecode: -> Meteor.user()?.profile?.phonecode
  hidePhoneConnector: ->
    if Router.current().route.path(this) == '/profile'
      false
    else
      !Meteor.user() or Meteor.user()?.profile?.phone or Meteor.user()?.profile?.bugmenot

# "Don't bug me" button
Template.phoneconnector.events
  'click #bugMeNot': (evt, template) ->
    evt.preventDefault()
    Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.bugmenot': true}}
