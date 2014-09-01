App = Ember.Application.create({});

$ ->
  $("#slider").slider
    value:100,
    min: 0,
    max: 500,
    step: 50,
    slide: ( event, ui ) ->
      console.log("DD")
