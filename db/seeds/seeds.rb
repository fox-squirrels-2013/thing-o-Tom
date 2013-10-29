require_relative '../../app.rb'
require 'faker'


class Seeds
  def self.run
    generate_players
    generate_games
  end

  @@positions = ["defensive handler", "offensive handler", "defensive cutter", "offensive cutter", "offensive receiver", "defensive receiver"]

  def self.generate_players
    10.times do
      Player.create(name: Faker::Name.name, number: rand(99), position: @@positions.sample)
    end
  end

  def self.generate_games
  end
end
