class exports.GameItemView extends Backbone.Marionette.ItemView
  template: require './templates/game/item'

  events:
    'click .btn' : 'btnClicked'

  btnClicked: ->
    $(event.target).parent().parent().parent().removeClass('panel-danger')
    if $(event.target).parents('#5490c83967a3bf7ef6072e3f').length
      $('#final0').text($(event.target).text())
    if $(event.target).parents('#5490c83967a3bf7ef6072e3e').length
      $('#final1').text($(event.target).text())
      
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
