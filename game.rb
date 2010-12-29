require 'config.rb'

class Game < ActiveRecord::Base
  def self.generate_record(game, home_v_away, wins, losses, pushes)
    if home_v_away == "home"
      if (game.home_score.to_f - game.spread) > game.away_score.to_f
        wins += 1
      elsif (game.home_score.to_f - game.spread) < game.away_score.to_f
        losses += 1
      elsif (game.home_score.to_f - game.spread) == game.away_score.to_f
        pushes += 1
      end
    else
      if (game.away_score.to_f + game.spread) > game.home_score.to_f
        wins += 1
      elsif (game.away_score.to_f + game.spread) < game.home_score.to_f
        losses += 1
      elsif (game.away_score.to_f + game.spread) == game.home_score.to_f
        pushes += 1
      end
    end
    return wins, losses, pushes
  end

  def self.ats(games)
    wins = 0
    losses = 0
    pushes = 0
    games.each do |g|
      wins, losses, pushes = generate_record(g, "home", wins, losses, pushes)
    end  
    puts "Home - (W):#{wins} (L):#{losses} (P):#{pushes}"
    puts wins.to_f/(wins.to_f + losses.to_f + pushes.to_f)
  end

  def self.ats_2(games)
    wins = 0
    losses = 0
    pushes = 0
    games.each do |g|
      if g.spread > 0
        wins, losses, pushes = generate_record(g, "away", wins, losses, pushes)
      elsif g.spread < 0
        wins, losses, pushes = generate_record(g, "home", wins, losses, pushes)
      end
    end
    puts "Favorites - (W):#{wins} (L):#{losses} (P):#{pushes}"
    puts wins.to_f/(wins.to_f + losses.to_f + pushes.to_f)
  end

  def self.ats_3(games)
    awins, alosses, apushes, wins, losses, pushes = 0
    alosses = 0
    apushes = 0
    wins = 0
    losses = 0
    pushes = 0
    games.each do |g|
      if g.spread > 0
        awins, alosses, apushes = generate_record(g, "away", awins, alosses, apushes)
      elsif g.spread < 0
        wins, losses, pushes = generate_record(g, "away", wins, losses, pushes)
      end
    end
    puts "Away Dogs - (W):#{awins} (L):#{alosses} (P):#{apushes}"
    puts awins.to_f/(awins.to_f + alosses.to_f + apushes.to_f)
    puts "Away Favs - (W):#{wins} (L):#{losses} (P):#{pushes}"
    puts wins.to_f/(wins.to_f + losses.to_f + pushes.to_f)
  end

  def self.avg_totals(games)
    score_total = 0
    game_total = 0
    games.all.each do |g|
      if g.home_score && g.away_score
        game_total += 1
        score_total += g.home_score
        score_total += g.away_score
      end
    end
    puts score_total.to_f/game_total.to_f
  end
  
end
