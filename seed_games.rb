require 'rubygems'
require 'fastercsv'
require 'config.rb'
require 'game.rb'
require 'playoff_game.rb'

#Game.connection.execute("TRUNCATE games")
Game.connection.execute("TRUNCATE playoff_games")
#FasterCSV.foreach("public/2010-nfl-schedule.csv") do |row|
#  Game.create!(:week_id => row[0].to_i, :date => "#{row[1]} #{row[2]}".to_time + 4.hours, :away => row[3], :home => row[4] )
#end

#Dir.foreach('nfllines') do |i|
#  if i =~ /.\.csv/
#    FasterCSV.foreach("nfllines/#{i}", {:headers => true}) do |row|
#      Game.create!(:date => row[0].to_time, :away => row[1], :home => row[3], :away_score => row[2], :home_score => row[4], :spread => row[5].to_f, :total_spread => row[6].to_f)
#    end
#  end
#end


Dir.foreach('playofflines') do |i|
  if i =~ /.\.csv/
    FasterCSV.foreach("playofflines/#{i}", {:headers => true}) do |row|
      PlayoffGame.create!(:date => row[0].to_time, :round => row[1], :away => row[2], :home => row[4], :away_score => row[3], :home_score => row[5], :spread => row[6].to_f, :total_spread => row[7].to_f)
    end
  end
end
