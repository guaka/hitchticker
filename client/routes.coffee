Router.route '/', ->
  @render 'stream'

Router.route '/help', ->
  @render 'help'

Router.route '/widget', ->
  @render 'widget'


Router.onBeforeAction 'bodyClass'


Router.route '/stream/:id', ->
  Session.set 'stream_id', @params.id
  @render 'stream'
