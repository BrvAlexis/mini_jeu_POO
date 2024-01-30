require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Demander le prénom du joueur
print "Entrez votre prénom : "
human_player = gets.chomp

human_player = HumanPlayer.new(human_player)


# Afficher un message pour indiquer que le joueur a été créé
puts "\n#{human_player.name}, tu es prêt(e) à affronter tes ennemis ?"

# Créer les ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")

# Mettre les ennemis dans un tableau
enemies = [player1, player2]

# Afficher un message pour indiquer que les ennemis sont prêts
puts "\nLes ennemis sont prêts à en découdre !"

# Boucle du combat
while human_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    # Afficher l'état du HumanPlayer
    puts "\n#{human_player.show_state}"

    # Menu d'actions pour le joueur
  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher un pack de points de vie"
  puts "Attaquer un joueur en vue :"
  puts " 0 - #{player1.show_state}" if player1.life_points
  puts " 1 - #{player2.show_state}" if player2.life_points
  print "> "
  choice = gets.chomp

   # Traitement des choix du joueur
   case choice
   when "a"
     human_player.search_weapon
   when "s"
     human_player.search_health_pack
   when "0"
     human_player.attacks(player1) if player1.life_points >= 0
   when "1"
     human_player.attacks(player2) if player2.life_points >= 0
   else
     puts "Choix invalide. Veuillez sélectionner une action valide."
   end

    # Afficher un message indiquant que les ennemis attaquent
  puts "\nLes autres joueurs t'attaquent !"

  # Les ennemis attaquent le HumanPlayer
  enemies.each do |enemy|
    enemy.attacks(human_player) if enemy.life_points >= 0
  end
end

# Message de fin de jeu
puts "\nLa partie est finie !"
if human_player.life_points >= 0
  puts "Bravo ! Tu as survécu !"
else
  puts "Loser ! Tu as perdu !"
end


