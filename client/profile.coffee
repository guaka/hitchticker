

Template.profile.events
  'submit form': (evt) ->
    evt.preventDefault()
    name = $('#name').val()
    phone = if $("#phone").intlTelInput("isValidNumber") then $('#phone').intlTelInput('getNumber') else ''
    if name
      Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.name': name}}
    if phone
      Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.phone': phone}}
    false

Template.profile.helpers
  'name': -> Meteor.user()?.profile?.name
  'phone': -> Meteor.user()?.profile?.phone

Template.profile.rendered = ->
  $("#phone").intlTelInput
    nationalMode: false
    autoHideDialCode: true
    autoFormat: false
    defaultCountry: 'de'
    preferredCountries: ['de']

Router.route '/profile', ->
  @render 'profile'

Router.route '/profile/:id', ->
  Session.set 'profile_id', @params.id
  @render 'profile'
