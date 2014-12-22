{Navbar} = require 'models/navbar'
app.models.navbar = new Navbar

{GameCollection} = require 'models/game'
app.collections.game = new GameCollection
app.collections.game.fetch()

{WinnerCollection} = require 'models/winner'
app.collections.winner = new WinnerCollection

{Error} = require 'models/error'
app.models.error = new Error
