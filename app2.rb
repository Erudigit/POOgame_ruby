require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

ennemies = []

puts "---- --- --- --- ----"
puts "| C'est l'heure du  |"
puts "| du-du-du-du-du-du |"
puts "|       DUEL !      |"
puts "---- --- --- --- ----"

puts "Quel est ton nom ?"
user_nom = gets.chomp
human_player1 = HumanPlayer.new("#{user_nom}")

ennemies << player1 = Player.new("Josiane")
ennemies << player2 = Player.new("josé")

while human_player1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts ""
    puts "-- La vie de #{human_player1.name} est de #{human_player1.life_points} ! --"
    puts ""
    # puts "Appuie sur entrer pour continuer"
    # gets.chomp
    # puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - Chercher une nouvelle arme"
    puts "s - Chercher un kit de soin"
    puts ""
    puts "Attaquer un nouveau joueur en vue :"
    puts ""
    if player1.life_points == 0 then 
        puts "#{player1.name} est mort !"
    else 
        print "0 - "
        print "#{player1.show_state}"
    end
    if player2.life_points == 0 then 
        puts "#{player2.name} est mort !"
    else
        print "1 - "
        puts "#{player2.show_state}"
    end
    print "Ta décision : "
    decision_user = gets.chomp
    if decision_user == "a" then 
        human_player1.search_weapon
        puts ""
    elsif decision_user == "s" then
        human_player1.search_health_pack
        puts ""
    elsif decision_user == "0" then
        human_player1.attacks(player1)
        player1.show_state
        puts ""
    elsif decision_user == "1" then 
        human_player1.attacks(player2)
        player2.show_state
        puts ""
    else 
        puts "Aucune action correspondante, tu passes ton tour !"
    end

    if player1.life_points > 0 || player2.life_points > 0 then 
        puts "---                      ---"
        puts "Aux ennemies de t'attaquer !"
        puts "---                      ---"
        puts "Appuie sur entrer pour continuer"
        gets.chomp
        puts ""
    end

    ennemies.each do |element|
        if element.life_points > 0 then
            element.attacks(human_player1)
        else
        end
    end
end

puts "---- --- --- --- ----"
puts "| Partie terminé !  |"
puts "---- --- --- --- ----"
puts ""

if human_player1.life_points > 0 then 
    puts "Bravo, tu as gagné !"
elsif player1.life_points > 0 || player2.life_points > 0 then 
    puts "Gros noob tu as perdu !"
end
