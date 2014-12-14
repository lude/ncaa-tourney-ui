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
      app.models.error.set 'message', "You did not select a winner for every game. Please go back and fix the entries marked in red."
      {ErrorView} = require 'views/error'
      app.views.error = new ErrorView
      $('#error-message').html app.views.error.render().$el
      #return
    warnsubmit = false
    $('.submit-form input[type=text]').each ->
        if not $(@).val()
          $(@).parent().addClass('has-error')
          warnsubmit = true
    if warnsubmit
      app.models.error.set 'message', "You did not fill out all the necessary forms. Please fill in the entries marked in red."
      {ErrorView} = require 'views/error'
      app.views.error = new ErrorView
      $('#error-message').html app.views.error.render().$el
      #return
    winners_list = []
    $('.btn-group-teams > .btn').each ->
      if $(@).hasClass('active') == true
        winning_team = $(@).text()
        game_id = $(@).parent().parent().parent().attr('id')
        winners_list.push({"game_id":game_id, "winning_team":winning_team})
      else
    console.log winners_list
    payload = {
      name: $('#name').text()
      email: $('#email').text()
      winner_tb: $('#winner').text()
      loser_tb: $('#loser').text()
      games_list: winners_list
    }
    $.ajax
      type: "POST"
      url: app.config.apiPrefix + 'winners'
      data:
        { "payload": payload }
      success: (response, status, xhr) =>
        @sendEvent 'videoReady'
      timeout: 15000

  keypressInput: ->
    $(event.target).parent().removeClass('has-error')
