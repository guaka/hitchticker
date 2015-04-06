
Template.ticks.helpers
  messages: ->
    if Session.get 'streamId'
      Messages.find { userId: Session.get('streamId') }, {sort: {datetime: -1}}
    else
      Messages.find {}, {sort: {datetime: -1}}

  prettyTime: (t) -> moment(t).format 'YYYY-MM-DD H:mm:ss'
  agoTime: (t) -> moment(t).fromNow()
  userName: (id) -> Meteor.users.findOne(id)?.profile.name or 'Anonymous'
  gravatar: (id) ->
    # Using crypto-md5 mrt package
    email = Meteor.users.findOne(id)?.emails?[0]?.address
    
    hash = (if (email) then CryptoJS.MD5(email.trim().toLowerCase()).toString() else '')
    # The previous line can probably become something like CryptoJS.MD5(email?.trim().toLowerCase()).toString() or ''
    '//gravatar.com/avatar/' + hash + '?s=64&d=identicon'
