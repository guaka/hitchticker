# Add each route name as a class to body
Router.onBeforeAction 'bodyClass'

Router.route '/', ->
  Session.set 'streamId', null
  @render 'stream'

Router.route '/help', ->
  @render 'help'

Router.route '/widget', ->
  @render 'widget'

Router.route '/widget/:id', ->
  Session.set 'streamId', @params.id
  @render 'widget'

Router.route '/stream/:id', ->
  Session.set 'streamId', @params.id
  @render 'stream'

Router.route '/stream/:id/:username', ->
  Session.set 'streamId', @params.id
  @render 'stream'

Router.route '/profile', ->
  Session.set 'streamId', Meteor.userId()
  @render 'profile'
