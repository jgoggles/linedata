require 'game.rb'

games = Game.where("date > '2008-09-01'").where("date < '2009-08-01'")
Game.ats(games)
Game.ats_2(games)
Game.ats_3(games)
