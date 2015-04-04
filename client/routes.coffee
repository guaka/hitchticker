Router.route '/', ->
  @render 'stream'

Router.route '/help', ->
  @render 'help'

Router.route '/widget', ->
  @render 'widget'


Router.onBeforeAction 'bodyClass'


Router.route '/stream/:id', ->
  Session.set 'streamId', @params.id
  @render 'stream'
