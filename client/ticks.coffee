
hashlinks = (text) ->
  text.replace /#(\w+)/g, '<a href="/hashtag/$1">#$1</a>'

Template.ticks.helpers
  messages: ->
    if Session.get 'streamId'
      Messages.find { userId: Session.get('streamId') }, {sort: {datetime: -1}}
    else if Session.get 'hashtag'
      Messages.find { text: {$regex : ".*" + Session.get('hashtag') + ".*"}}
    else
      Messages.find {}, {sort: {datetime: -1}}

  prettyTime: (time) -> moment(time).format 'YYYY-MM-DD H:mm'
  agoTime: (time) -> moment(time).fromNow()
  shortText: (text) -> hashlinks text.substr(0, 400)
  hashlinks: hashlinks
  isTextLong: (text) ->
    if text.length > 400 then true else false
  userName: (id) -> Meteor.users.findOne(id)?.profile.name or 'Anonymous'
  gravatar: (id) ->
    # Using crypto-md5 mrt package
    email = Meteor.users.findOne(id)?.emails?[0]?.address
    hash = (if (email) then CryptoJS.MD5(email.trim().toLowerCase()).toString() else '')
    # The previous line can probably become something like CryptoJS.MD5(email?.trim().toLowerCase()).toString() or ''
    '//gravatar.com/avatar/' + hash + '?s=64&d=identicon'

# Toggle long tick text open
Template.ticks.events
  'click .tick-longtext-toggle': (evt, template) ->
    evt.preventDefault()
    $(evt.currentTarget).addClass("is-toggled")


