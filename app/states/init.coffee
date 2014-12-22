app.stateChart.addState 'Top',
  initialSubstate: 'Top > Initialize'

app.stateChart.addState 'Top > Initialize',
  enterState: ->
    {NavbarView} = require 'views/navbar'
    app.views.navbar = new NavbarView
      model: app.models.navbar
    app.layouts.main = require 'layouts/main'
    $("body").html app.layouts.main.render().$el
    app.layouts.main.navRegion.show app.views.navbar

  goToGames: ->
    @goToState 'Top > Show Games List'
    @sendEvent 'showGamesList'

  goToWinnerList: (id) ->
    @goToState 'Top > Show Winners List'
    @sendEvent 'showWinnerList', id

  goToAllWinnerList: ->
    @goToState 'Top > Show All Winners List'
    @sendEvent 'showAllWinnerList'

app.stateChart.addState 'Top > Show Games List',
  enterState: ->
    {GameListView} = require 'views/game'
    app.views.gamelist = new GameListView
      collection: app.collections.game

    {SubmitView} = require 'views/submit'
    app.views.submit = new SubmitView

  showGamesList: ->
    app.layouts.main.gamesRegion.show app.views.gamelist
    app.layouts.main.submitRegion.show app.views.submit

  winnerList: (id) ->
    app.layouts.main.submitRegion.reset()
    app.routers.main.navigate 'winners/' + id
    @goToState 'Top > Show Winners List'
    @sendEvent 'showWinnerList', id

app.stateChart.addState 'Top > Show Winners List',
  showWinnerList: (id) ->
    {Winner} = require 'models/winner'
    app.models.sel_winner = new Winner
    app.models.sel_winner.set '_id', id
    app.models.sel_winner.fetch success: ->
      app.stateChart.sendEvent 'displayWinnerList'
      return

  displayWinnerList: ->
    {WinnerListView} = require 'views/winner'
    console.log app.models.sel_winner.get('email')
    app.views.winnerlist = new WinnerListView
      model: app.models.sel_winner

    app.layouts.main.gamesRegion.show app.views.winnerlist
    $("html, body").animate
      scrollTop: 0
    , "slow"


app.stateChart.addState 'Top > Show All Winners List',
  showAllWinnerList: ->
    app.collections.winner.fetch success: ->
      app.stateChart.sendEvent 'displayAllWinnerList'
      return

  displayAllWinnerList: ->
    {WinnersView} = require 'views/winner'
    app.views.winners = new WinnersView
      collection: app.collections.winner

    app.layouts.main.gamesRegion.show app.views.winners
    $("html, body").animate
      scrollTop: 0
    , "slow"
