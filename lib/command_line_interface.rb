require "pry"
class CLI
  def welcome
    puts "Hello! My name is Professor Oakiron. My, you've grown!"
  end

  def get_input
    gets.chomp
  end

  def sign_in
    puts "Please type your name:"
  end

  def get_username
    user_input = gets.chomp
    @user = User.find_or_create_by(name: user_input)
  end

  def congrats
    puts "Well, you're all signed in now, #{@user.name}. Off you go! Take good care of your pokemon! "
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

      Please tell me what you'd like to do! Type the number of the task."

      user_input = gets.chomp.to_i
      case user_input
      when 1
        Pokemon.display_all_pokemon
      when 2
        puts "Alright! Your team is:"
        puts @user.pokemons.pluck(:name)
        puts "
What a great bunch!
        "
      when 3
        @user.battle_pokemon
      when 4
        @user.remove_pokemon_from_team
      when 5
        @user.lucky_dip
      else
        puts "Sorry! That's not a valid choice. Here are the options again:"
        menu
      end
      return_to_menu
    end

    def return_to_menu
      puts "Would you like to return to the menu? Hit enter if yes, otherwise type 'exit' to exit."
        user_input = gets.chomp
        case user_input
        when "exit"
          exit
        else
          menu
        end
      end
end
