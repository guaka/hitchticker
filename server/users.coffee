uniqueKey = ->
  Math.floor(Math.random() * 9999) + 1000

Accounts.onCreateUser (options, user) ->
  console.log "Creating user: "
  console.log EJSON.stringify options
  options.profile.phonecode = uniqueKey()
  user.profile = options.profile || {}
  user
