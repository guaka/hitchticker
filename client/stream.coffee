

Template.stream.helpers
  'streamId': -> Session.get('streamId')? or false # This looks ugly. Can it be simplified?
  
