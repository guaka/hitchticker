

Template.profile.events
  'submit form': (evt) ->
    evt.preventDefault()
    name = $('#name').val()
    if name
      Meteor.users.update {_id: Meteor.userId()}, {$set: {'profile.name': name}}
    false

Template.profile.helpers
  'name': -> Meteor.user()?.profile?.name
  'phone': -> Meteor.user()?.profile?.phone
