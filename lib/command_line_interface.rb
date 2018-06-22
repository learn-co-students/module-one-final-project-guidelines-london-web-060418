
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
    puts "Well, you're all signed in now, #{@user.name}."
    sleep(1.seconds)
    puts "Here, we'll give you one pokemon to start off with."
    bar = ProgressBar.new(50, :bar, :percentage)
    50.times do
      sleep 0.1
      bar.increment!
    end
    puts "Off you go! Take good care of your pokemon!"
    @user.pokemons << Pokemon.all.sample
    sleep(2.seconds)
    menu
  end

  def menu
    prompt = TTY::Prompt.new
    choices = [ "Display all pokemon in the pokedex", "View your team", "Catch a new pokemon", "Release one of your pokemon", "Lucky dip", "Exit"]
    prompt.enum_select("Main menu:", choices)
      user_input = gets.chomp.to_i
      case user_input
      # when 1
      #   Pokemon.display_all_pokemon
      # when 2
      #   puts "Alright! Your team is:"
      #   puts @user.pokemons.pluck(:name)
      # when 3
      #   @user.battle_pokemon
      # when 4
      #   @user.remove_pokemon_from_team
      # when 5
      #   @user.lucky_dip
      # when 6
      #   exit
      # else
      #   puts "Sorry! That's not a valid choice. Here are the options again:"
      #   menu
      # end
      # return_to_menu
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
