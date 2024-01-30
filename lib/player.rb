

class Player
    attr_accessor :name, :life_points

    def initialize(name, life_points)
        @name = name
        @life_points = life_points
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
        puts "#{@name} attaque #{player.name}"
        damage = compute_damage
        player.gets_damage(damage)
        puts "Il lui inflige #{damage} points de dommages"
      end
    
      
    
      def compute_damage
        rand(1..6) 
      end

end