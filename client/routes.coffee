Router.route '/', ->
  @render 'stream'

Router.route '/help', ->
  @render 'help'

Router.route '/widget', ->
  @render 'widget'


Router.onBeforeAction 'bodyClass'

