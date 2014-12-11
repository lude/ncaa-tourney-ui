app.stateChart.addState 'Top',
  substatesAreConcurrent: yes
  #move this to an onLoaded callback when you actually write something
  enterState: ->
    {NavbarView} = require 'views/navbar'
    app.views.navbar = new NavbarView
      model: app.models.navbar
    app.layouts.main = require 'layouts/main'
    $("body").html app.layouts.main.render().$el
    app.layouts.main.navRegion.show app.views.navbar

    {GameListView} = require 'views/game'
    app.views.gamelist = new GameListView
      collection: app.collections.game
    app.layouts.main.appRegion.show app.views.gamelist
