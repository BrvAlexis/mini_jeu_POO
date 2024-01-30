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
player_name = gets.chomp

human_player = HumanPlayer.new(player_name)

# Afficher un message pour indiquer que le joueur a été créé
puts "\n#{player_name}, tu es prêt(e) à affronter tes ennemis ?"

# Créer les ennemis
enemy1 = Player.new("Josiane")
enemy2 = Player.new("José")

# Mettre les ennemis dans un tableau
enemies = [enemy1, enemy2]

# Afficher un message pour indiquer que les ennemis sont prêts
puts "\nLes ennemis sont prêts à en découdre !"

# Boucle du combat
while human_player.alive? && (enemy1.alive? || enemy2.alive?)
    # Afficher l'état du HumanPlayer
    puts "\n#{human_player.show_state}"

    # Menu d'actions pour le joueur
  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher un pack de points de vie"
  puts "Attaquer un joueur en vue :"
  puts "0 - #{enemy1.show_state}" if enemy1.alive?
  puts "1 - #{enemy2.show_state}" if enemy2.alive?
  print "> "
  choice = gets.chomp

   # Traitement des choix du joueur
   case choice
   when "a"
     human_player.search_weapon
   when "s"
     human_player.search_health_pack
   when "0"
     human_player.attacks(enemy1) if enemy1.alive?
   when "1"
     human_player.attacks(enemy2) if enemy2.alive?
   else
     puts "Choix invalide. Veuillez sélectionner une action valide."
   end

    # Afficher un message indiquant que les ennemis attaquent
  puts "\nLes autres joueurs t'attaquent !"

  # Les ennemis attaquent le HumanPlayer
  enemies.each do |enemy|
    enemy.attacks(human_player) if enemy.alive?
  end
end

# Message de fin de jeu
puts "\nLa partie est finie !"
if human_player.alive?
  puts "Bravo ! Tu as survécu !"
else
  puts "Loser ! Tu as perdu !"
end


