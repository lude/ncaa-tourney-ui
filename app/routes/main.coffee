class exports.MainRouter extends Backbone.Marionette.AppRouter

  routes:
    '': 'games'
    'winners/:id': 'winnerList'
    'apple': 'allWinnerList'
  #
  #TODO re-fetch (and thus check) session data
  games: ->
    app.stateChart.sendEvent 'goToGames'

  winnerList: (id) ->
    app.stateChart.sendEvent 'goToWinnerList', id

  allWinnerList: ->
    app.stateChart.sendEvent 'goToAllWinnerList'
