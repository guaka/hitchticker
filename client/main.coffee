


#
# Ticks
#
Template.ticks.helpers
  messages: Messages.find {}, {sort: {datetime: -1}}
  prettyTime: (t) -> moment(t).format 'YYYY-MM-DD H:mm:ss'
  userName: (id) -> 'Anonymous'#Meteor.users.findOne(id)?.username
  #userEmail: (id) -> Meteor.users.findOne(id)?.emails?[0]?.address
  gravatar: () -> 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='
