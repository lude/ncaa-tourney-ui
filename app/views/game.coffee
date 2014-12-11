class exports.GameItemView extends Backbone.Marionette.ItemView
  template: require './templates/game/item'
  onRender: ->
    $(@el).addClass 'warning' if @model.get('priority') is 'Urgent'
    $(@el).addClass 'danger' if @model.get('priority') is 'Outage'
    $(@el).addClass 'success' if @model.get('status') is 'claimed'
    $(@el).addClass 'active' if @model.get('status') is 'closed'

  modelEvents:
    'change' : 'render'

class exports.GameListView extends Backbone.Marionette.CompositeView
  childView: exports.GameItemView
  childViewContainer: ->
    '#item'
  template: require './templates/game/list'
  collectionEvents:
    'sync': 'render'
    'refresh': 'render'
