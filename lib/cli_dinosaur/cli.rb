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

        if user_input.to_i.between?(1)
end