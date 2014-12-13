class exports.SubmitView extends Backbone.Marionette.ItemView
  template: require './templates/submit'

  events:
    'click #submitEntry' : 'submitEntry'
    'keyup input[type=text]': 'keypressInput'

  submitEntry: ->
    console.log "submit entry clicked, here we go"
    warngames = false
    $('.panel').each ->
      if $(@).find("label.active").length is 0
        $(@).addClass "panel-danger"
        warngames = true
    if warngames
      {ErrorView} = require 'views/error'
      app.views.error = new ErrorView
        message: "You did not select a winner for every game. Please go back and fix the entries marked in red."
      $('#error-message').html app.views.error.render().$el
    #set a breakpoint here in the logic
    warnsubmit = false
    $('.submit-form input[type=text]').each ->
        if not $(@).val()
          $(@).parent().addClass('has-error')
          warnsubmit = true
    if warnsubmit
      {ErrorView} = require 'views/error'
      app.views.error = new ErrorView
        message: "You did not fill out all the necessary forms. Please fill in the entries marked in red."
      $('#error-message').html app.views.error.render().$el
    $('.btn-group-teams > .btn').each ->
      if $(@).hasClass('active') == true
        console.log "Found a checked one!"
      else

  keypressInput: ->
    $(event.target).parent().removeClass('has-error')
