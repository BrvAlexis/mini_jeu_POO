require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#À ma droite "Josiane" : crée un Player répondant à ce doux prénom et stocké dans la variable player1
player1 = Player.new("Josiane",10)

#À ma gauche "José" : crée un autre Player répondant à ce joli prénom et stocké dans la variable player2
player2 = Player.new("José",10)

#Présentons les deux combattants : affiche dans le terminal l'état de chaque combattant grâce à des puts et des show_state. 
#Juste avant, affiche un petit puts "Voici l'état de chaque joueur :".

puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state

#Fight ! Indique que le combat commence avec un puts "Passons à la phase d'attaque :"
puts "Passons à la phase d'attaque :"



while player1.life_points > 0 && player2.life_points > 0
    #Josiane aura l'honneur d'attaquer la première : 
#fais attaquer player2 par player1 avec la méthode attacks.
    player1.attacks(player2)
    player2.show_state
  
    # Vérifie si player2 est toujours en vie avant de le laisser attaquer
    if player2.life_points <= 0
      puts "#{player2.name} a été tué !"
      break
    end
  
    player2.attacks(player1)
    player1.show_state
  end
  


puts "Le combat est terminé !"
player1.show_state
player2.show_state




