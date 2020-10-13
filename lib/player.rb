class Player 
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{@name} à #{@life_points} points de vies"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0 then 
            puts "#{name} est mort !"
            @life_points = 0
        else
            return @life_points
        end
    end

    def attacks(player_under_attack)
        puts "#{@name} attaque #{player_under_attack.name} !"
        damage = compute_damage
        puts "Il lui inflige #{damage} points de dommages !"
        player_under_attack.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @life_points = 100
        @weapon_level = 1
        @name = name
    end

    def show_state
        puts "#{@name} à #{@life_points} points de vies et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > @weapon_level then 
            puts "Youhou, elle est meilleure que la tienne, tu la gardes !"
            @weapon_level = new_weapon_level
        else 
            "M@?-!.. Elle est pas mieux que ton arme actuelle !"
        end
    end

    def search_health_pack 
        dice = rand(1..6)
        puts "dice vaut #{dice}"
        if dice == 1 then 
            puts "Tu n'as rien trouvé..."
        elsif dice >= 2 && dice <= 5 then 
            @life_points = @life_points + 50
            if @life_points >= 100 then 
                @life_points = 100
            end
            puts "Bravo tu as trouvé un pack +50 points de vie !"
        elsif dice == 6 then 
            @life_points = @life_points + 80 
            if @life_points >= 100 then 
                @life_points = 100
            end
            puts "Wahou, bravo, tu as trouvé un pack +80 points de vie !" 
        end
    end
end