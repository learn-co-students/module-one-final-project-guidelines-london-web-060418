require "pry"
class CLI
  def welcome
    puts "Hello! My name is Professor Oakiron. My, you've grown!".yellow.on_blue
  end

  def get_input
    text = gets.chomp

    text.colorize(color: :yellow)
  end

  def sign_in
    puts "Please type your name:".yellow.on_blue
  end

  def get_username
    user_input = gets.chomp
    @user = User.find_or_create_by(name: user_input)
  end

  def congrats
    puts "Well, you're all signed in now, #{@user.name}.".yellow.on_blue
    sleep(2.seconds)
    puts "Here, we'll give you one pokemon to start off with.".yellow.on_blue
    sleep(2.seconds)
    puts "Off you go! Take good care of your pokemon!".yellow.on_blue
    @user.pokemons << Pokemon.all.sample
    menu
  end

  def menu
    puts "
    Main menu:

          1. Display all pokemon in the pokedex
          2. View your team
          3. Catch a new pokemon
          4. Release one of your pokemon
          5. Lucky dip
          6. Exit

      Please tell me what you'd like to do! Type the number of the task.".colorize(:color => :yellow)

      user_input = gets.chomp.to_i
      case user_input
      when 1
        Pokemon.display_all_pokemon
      when 2
        puts "Alright! Your team is:".yellow.on_blue
        @user.pokemons.pluck(:name).each do |name|
          puts name.colorize(color: :yellow)
        end
      when 3
        @user.battle_pokemon
      when 4
        @user.remove_pokemon_from_team
      when 5
        @user.lucky_dip
      when 6
        exit
      else
        puts "Sorry! That's not a valid choice. Here are the options again:".yellow.on_blue
        menu
      end
      return_to_menu
    end

    def return_to_menu
      puts "Would you like to return to the menu? Hit enter if yes, otherwise type 'exit' to exit.".yellow.on_blue
        user_input = gets.chomp
        case user_input
        when "exit"
          exit
        else
          menu
        end
      end
end
