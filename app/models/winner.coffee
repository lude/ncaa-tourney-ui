class exports.Winner extends Backbone.Model
  url: ->
    app.config.apiPrefix + 'winners/' + @get('_id')

  idAttribute: 'id'

  initialize: ->
    @calculate
    @on 'change:games_list', @calculate

  calculate: ->
    games_list = @get 'games_list'
    if games_list
      l = games_list.length
      i = 0
  
      while i < l
        name = app.collections.game.get(games_list[i]['game_id']).get('name')
        games_list[i]['game_name'] = name
        i++
  
      @set 'games_list', games_list


class exports.WinnerCollection extends Backbone.Collection
  model: exports.Winner
  url: app.config.apiPrefix + 'winners'
