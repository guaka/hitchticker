Router.route '/', ->
	this.render 'stream'

Router.route '/help', ->
	this.render 'help'

Router.route '/profile', ->
  this.render 'profile'

Router.route '/widget', ->
  this.render 'widget'


Router.onBeforeAction('bodyClass')
