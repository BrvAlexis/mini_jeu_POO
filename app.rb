require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José", 10)

player1.gets_damage(5)  # Player José takes 5 damage
player1.show_state      # Output: José a 5 points de vie



binding.pry

