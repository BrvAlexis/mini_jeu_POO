

class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end
    
    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = life_points - damage
        if @life_points <= 0
          puts "Le joueur #{@name} a été tué !"
        @life_points = 0  # evite que le score descende en négatif
        end
    end

    def attacks(player)
        puts "\n#{@name} attaque #{player.name}"
        damage = compute_damage
        player.gets_damage(damage)
        puts "Il lui inflige #{damage} points de dommages"
      end
    
      
    
      def compute_damage
        rand(1..6) 
      end

end


class HumanPlayer < Player
    attr_accessor :weapon_level,

    def initialize(name)
    @weapon_level = 1
    @life_points = 100
    end
       
    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end
    
    
    def search_weapon
    #Elle va commencer par lancer un "dé" 
    #dont le résultat sera compris entre 1 et 6 (tu sais faire ça maintenant non?).
        new_weapon_level = rand(1..6)
    # Annonce le résultat de la recherche à l'utilisateur en affichant un message du genre 
    #"Tu as trouvé une arme de niveau XXX".
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}."

    #Maintenant, cherche à savoir si ça vaut le coup pour le joueur Human Player de la garder… 
    #Utilise un if pour comparer le niveau de cette nouvelle arme avec celle qu'il possède déjà (@weapon_level)
            if new_weapon_level > @weapon_level
        #Si l'arme trouvée est d'un niveau strictement supérieur, il la garde. Son @weapon_level prend alors la valeur de la nouvelle arme .
        @weapon_level = new_weapon_level
        puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."

        #Si l'arme trouvée est égale ou moins bien que son arme actuelle,
        # tu ne changes rien et ne fais qu'afficher un petit "M@*#$... elle n'est pas mieux que ton arme actuelle..."
            else
        puts "M@*#$... Elle n'est pas mieux que ton arme actuelle..."
            end
    end

    def search_health_pack
        #Elle commence également par lancer un "dé" dont le résultat sera compris entre 1 et 6. 
        #En fonction du résultat, voilà ce qu'elle devra faire :
        dice_result = rand(1..6)
    
        #Si le résultat est égal à 1, le joueur n'a rien trouvé et on retourne simplement le string "Tu n'as rien trouvé... ".
        if dice_result == 1
          "Tu n'as rien trouvé..."
        
        #Si le résultat est compris entre 2 (inclus) et 5 (inclus), le joueur a trouvé un pack de 50 points de vie. On va donc augmenter sa vie de 50 points mais sans qu'elle puisse dépasser 100 points. 
        #Puis on va retourner le string "Bravo, tu as trouvé un pack de +50 points de vie !".
        elsif dice_result.between?(2, 5)
          heal_points = [50, 100 - @life_points].min
          @life_points += heal_points
          "Bravo, tu as trouvé un pack de +#{heal_points} points de vie !"
        #Si le résultat est égal à 6, le joueur a trouvé un pack de 80 points de vie. On va donc augmenter sa vie de 80 points mais sans qu'elle puisse dépasser 100 points. 
        #Puis on va retourner le string "Waow, tu as trouvé un pack de +80 points de vie !".
        
        else
          heal_points = [80, 100 - @life_points].min
          @life_points += heal_points
          "Waow, tu as trouvé un pack de +#{heal_points} points de vie !"
        end
    end
end
