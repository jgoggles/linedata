require 'config.rb'

class CreatePlayoffGames < ActiveRecord::Migration
  def self.up
    create_table :playoff_games do |t|
      t.datetime :date
      t.string :round
      t.string :home
      t.string :away
      t.integer :home_score
      t.integer :away_score
      t.float :spread
      t.float :total_spread

      t.timestamps
    end
  end

  def self.down
    drop_table :playoff_games
  end
end
  
CreatePlayoffGames.up
