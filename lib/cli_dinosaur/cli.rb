class DinosaurCli::CLI
    def start
        system('clear') 

        puts "Welcome to the Dinosaur-aus!"
        puts "Loading all your Dinosaurs..."

        DinosaurCli::API.new.get_all_dinosaurs

        puts "Calling All Dinosaurs"
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' for a list of dinosaurs"
        put "Type '2' to exit program"
        main_menu_input
    end

    def main_menu_input
        user_input = gets.strip

        if user_input == "1"
            list_dinosaurs
            sub_menu_options
        elsif user_input.downcase == "exit"
            goodbye
        begin
            invalid_choice
            main_menu_options
        end
    end

    def sub_menu_input
        user_input = get.strip

        if user_input.to_i.between?(1, DinosaurCli::Dinosaur.all.length)
            dinosaur = DinosaurCli::Dinosaur.all[user_input.to_i -1]
            print_dinosaur_information(dinosaur)
            continue?
        elsif user_input.downcase == "exit"
            goodbye
        else 
            invalid_choice
            sub_menu_options
        end
    end

    def list_dinosaurs
        DinosaurCli::Dinosaur.all.each.with_index(1) do |dinosaur, d|
            puts "#{d}. #{dinosaur.name}"
        end
    end

    def print_dinosaur_information(dinosaur)
        puts "Name: #{dinosaur.name}"
        puts "Description: #{dinosaur.description}"
    end

    def continue?
        puts "Type '1' for main menu, '2' to select a new Dinosaur, '3' to exit Dinosaur-aus"

        user_input = gets.strip

        if user_input == "1"
            main_menu_options
        elsif user_input == "2"
            list_dinosaurs
            sub_menu_options
        elsif user_input == "3"
            goodbye
        else
            invalid_choice
            continue?
        end
    end

    def invalid_choice
        puts "Be careful that T-rex will get you. Let's try that again!"
    end

    def goodbye
        puts "Have a wonderful day. Come visit us dinosaurs again, soon!"
    end
end