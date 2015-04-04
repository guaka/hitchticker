
Accounts.onCreateUser (options, user) ->
  console.log "Creating user: "
  console.log EJSON.stringify options
  user.profile = options.profile || {}
  user

  
    
