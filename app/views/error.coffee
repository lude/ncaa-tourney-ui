class exports.ErrorView extends Backbone.Marionette.ItemView
  template: require './templates/error'
  templateHelpers:
    message: ->
      @message
