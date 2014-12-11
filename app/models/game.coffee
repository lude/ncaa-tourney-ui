class exports.Game extends Backbone.Model
  url: ->
    app.config.apiPrefix + 'games/' + @get('_id')

class exports.GameCollection extends Backbone.Collection
  model: exports.Game
  url: app.config.apiPrefix + 'games/list'
