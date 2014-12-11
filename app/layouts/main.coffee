class MainLayout extends Marionette.LayoutView
  template: require './templates/main'

  regions:
    navRegion: '#nav'
    appRegion: '#app'

module.exports = new MainLayout()
