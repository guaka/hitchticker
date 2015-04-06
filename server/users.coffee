uniqueKey = ->
  Math.floor(Math.random() * 9999) + 1000

Accounts.onCreateUser (options, user) ->
  # This also handles signup fields
  console.log "Creating user: "
  console.log EJSON.stringify options
  options.profile.phonecode = uniqueKey()
  user.profile = options.profile || {}
  user
