require 'config.rb'

class Game < ActiveRecord::Base
  def self.ats
    wins = 0
    losses = 0
    pushes = 0
    all.each do |g|
      if (g.home_score.to_f - g.spread) > g.away_score.to_f
        wins += 1
      elsif (g.home_score.to_f - g.spread) < g.away_score.to_f
        losses += 1
      elsif (g.home_score.to_f - g.spread) == g.away_score.to_f
        pushes += 1
      end
    end  
    puts "Home - (W):#{wins} (L):#{losses} (P):#{pushes}"
  end

  def self.ats_2
    wins = 0
    losses = 0
    pushes = 0
    all.each do |g|
      if g.spread > 0
        if (g.away_score.to_f + g.spread) > g.home_score.to_f
          wins += 1
        elsif (g.away_score.to_f + g.spread) < g.home_score.to_f
          losses += 1
        elsif (g.away_score.to_f + g.spread) == g.home_score.to_f
          pushes += 1
        end
      elsif g.spread < 0
        if (g.home_score.to_f - g.spread) > g.away_score.to_f
          wins += 1
        elsif (g.home_score.to_f - g.spread) < g.away_score.to_f
          losses += 1
        elsif (g.home_score.to_f - g.spread) == g.away_score.to_f
          pushes += 1
        end
      end
    end
    puts "Favorites - (W):#{wins} (L):#{losses} (P):#{pushes}"
  end
end

Game.ats
Game.ats_2
