class Game 
    attr_accessor :human_player, :ennemies

    def initialize(name)
        @human_player = HumanPlayer.new("#{name}")
        @ennemies = [Player.new("player1"), Player.new("player2"), Player.new("player3"), Player.new("player4")]
    end

    def kill_player(number_player)
        @ennemies.delete_at(number_player)
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && !@ennemies.empty? 
            return true
        else 
            return false
        end
    end

    def show_players
        puts "#{@human_player.name} est à #{@human_player.life_points} points de vies"
        puts "Il reste #{@ennemies.length} ennemies !"
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a - Chercher une nouvelle arme"
        puts "s - Chercher un kit de soin"
        puts ""
        puts "Attaquer un nouveau joueur en vue :"
        puts ""
        i = 0
        @ennemies.each do |element|
            print "#{i} - "
            puts "#{element.show_state}"
            i = i + 1
        end
        return i
    end

    def menu_choice(player_choice)
        i = 0
        @ennemies.each do |element|
            i = i + 1
        end
        print "Ta décision : "
        #decision_user = gets.chomp
        if player_choice == "a" then 
            @human_player.search_weapon   # Pourquoi @ ??
            puts ""
        elsif player_choice == "s" then
            @human_player.search_health_pack  # Pourquoi @ ??
            puts ""
        elsif player_choice > 0 && player_choice <=i 
            @human_player.attacks(@ennemies[player_choice.to_i])
            @ennemies[player_choice.to_i].show_state
            puts ""
        #elsif player_choice == 
        # elsif player_choice == "0" then
        #     human_player1.attacks(player1)
        #     player1.show_state
        #     puts ""
        # elsif player_choice == "1" then 
        #     human_player1.attacks(player2)
        #     player2.show_state
        #     puts ""
        else 
            puts "Aucune action correspondante, tu passes ton tour !"
        end
    end
end