require 'config.rb'

class Game < ActiveRecord::Base
    def self.ats(team)
        wins = 0
        losses = 0
        pushes = 0
        all.each do |g|
            if team == "home"
                if (g.home_score.to_f - g.spread) > g.away_score.to_f
                    wins += 1
                elsif (g.home.to_f - g.spread) < g.away_score.to_f
                    losses += 1
                elsif (g.home.to_f - g.spread) == g.away_score.to_f
                    pushes += 1
                    puts g.id
                end
            else
                if (g.away_score.to_f + g.spread) > g.home_score.to_f
                    wins += 1
                elsif (g.away_score.to_f + g.spread) < g.home_score.to_f
                    losses += 1
                elsif (g.away_score.to_f + g.spread) == g.home_score.to_f
                    pushes += 1
                    puts g.id
                end
            end
        end  
        puts "#{wins}-#{losses}-#{pushes}"
    end
end

Game.ats("away")
