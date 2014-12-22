class exports.WinnerListView extends Backbone.Marionette.ItemView
  template: require './templates/winner'

#this is the admin winner view class, not the post-submission class
#when you come back to this code in a year, slap yourself again for me
class exports.WinnersItemView extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: require './templates/winner/item'
  modelEvents:
    'change' : 'render'

class exports.WinnersView extends Backbone.Marionette.CompositeView
  childView: exports.WinnersItemView
  childViewContainer: ->
    'tbody'
  template: require './templates/winner/list'
  collectionEvents:
    'sync': 'render'
    'refresh': 'render'
