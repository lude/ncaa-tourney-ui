class MainLayout extends Marionette.LayoutView
  template: require './templates/main'

  regions:
    navRegion: '#nav'
    gamesRegion: '#games'
    submitRegion: '#submit'

module.exports = new MainLayout()
