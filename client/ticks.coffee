#
# Ticks
#
Template.ticks.helpers
  messages: ->
    if Session.get 'streamId'
      Messages.find { userId: Session.get('streamId') }, {sort: {datetime: -1}}
    else
      Messages.find {}, {sort: {datetime: -1}}

  prettyTime: (time) -> moment(time).format 'YYYY-MM-DD H:mm'
  agoTime: (time) -> moment(time).fromNow()
  shortText: (text) -> text.substr(0, 400)
  isTextLong: (text) ->
    if text.length > 400 then true else false
  userName: (id) -> Meteor.users.findOne(id)?.profile.name or 'Anonymous'
  gravatar: (id) ->
    # Using crypto-md5 mrt package
    email = Meteor.users.findOne(id)?.emails?[0]?.address
    hash = (if (email) then CryptoJS.MD5(email.trim().toLowerCase()).toString() else '')
    '//gravatar.com/avatar/' + hash + '?s=64&d=identicon'

# Toggle long tick text open
Template.ticks.events
  'click .tick-longtext-toggle': (evt, template) ->
    evt.preventDefault()
    $(evt.currentTarget).addClass("is-toggled")
