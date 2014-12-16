{Navbar} = require 'models/navbar'
app.models.navbar = new Navbar

{GameCollection} = require 'models/game'
app.collections.game = new GameCollection
app.collections.game.fetch()

{Error} = require 'models/error'
app.models.error = new Error
