require 'game.rb'
require 'playoff_game'

games = PlayoffGame.where("date > '2000-09-01'").where("date < '2019-08-01'")
PlayoffGame.ats(games)
PlayoffGame.ats_2(games)
PlayoffGame.ats_3(games)
PlayoffGame.avg_totals(games)
