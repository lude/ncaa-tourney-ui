{Navbar} = require 'models/navbar'
app.models.navbar = new Navbar

{GameCollection} = require 'models/game'
app.collections.game = new GameCollection
app.collections.game.fetch()

{WinnerCollection} = require 'models/winner'
app.collections.winner = new WinnerCollection

{Error} = require 'models/error'
app.models.error = new Error

app.collections.results = [
    " Louisiana Tech"
    " Rutgers"
    " NC State"
    " Virginia Tech"
    " South Carolina"
    " Penn State"
    " Texas A&M"
    " Arkansas"
    " Stanford"
    " Houston"
    " Tennessee"
    " Oklahoma State"
    "24 USC"
    " Notre Dame"
    "22 Utah"
    "18 Wisconsin"
    "17 Clemson"
    "16 Missouri"
    "15 Arizona State"
    "13 Georgia"
    "14 UCLA"
    "20 Boise State"
    "12 Georgia Tech"
    "6 TCU"
    "8 Michigan State"
    "2 Oregon"
    "4 Ohio State"
    " Florida"
    " Toledo"
]
