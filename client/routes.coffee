Router.route '/', ->
  @render 'stream'

Router.route '/help', ->
  @render 'help'
