

Template.profile.events
  'submit form': (evt) ->
    evt.preventDefault()
    name = $('#name').val()
    if name
      Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.name': name}}
    if $("#phone").intlTelInput("isValidNumber") 
      phone = $('#phone').intlTelInput('getNumber')
      Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.phone': phone}}
    else
      alert 'not a valid number'  # todo: fix
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

