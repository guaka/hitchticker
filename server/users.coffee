
Accounts.onCreateUser (options, user) ->
  # This also handles signup fields
  console.log "Creating user: "
  console.log EJSON.stringify options
  user.profile = options.profile || {}
  user

  
    
