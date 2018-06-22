
class CLI
  def welcome
    @pid = fork{ exec 'afplay', "lib/opening.mp3" }
    puts_slow "Hello! My name is Professor Oakiron. My, you've grown!".yellow.on_blue
  end

  def quit
    fork{ exec 'killall', "afplay" }
    exit
  end

  def puts_slow(str)
    chars = str.split(//)
    chars.each do |c|
      print c
      sleep 0.05
    end
    print "\n"
  end

  def get_input
    text = gets.chomp

    text.colorize(color: :yellow)
  end

  def sign_in
    puts_slow "Please type your name:".yellow.on_blue
  end

  def get_username
    user_input = gets.chomp
    @user = User.find_or_create_by(name: user_input)
  end

  def congrats
    puts_slow "Well, you're all signed in now, #{@user.name}.".yellow.on_blue
    sleep(1.seconds)
    puts_slow "Here, we'll give you one pokemon to start off with.".yellow.on_blue
    sleep(1.seconds)
    bar = ProgressBar.new(50, :bar, :percentage)
    50.times do
      sleep 0.05
      bar.increment!
    end
    puts_slow "Off you go! Take good care of your pokemon!".yellow.on_blue
    @user.pokemons << Pokemon.all.sample
    sleep(2.seconds)
    menu
  end

  def menu
    prompt = TTY::Prompt.new
    choices = [ "Display all pokemon in the pokedex".colorize(:color => :yellow), "View your team".colorize(:color => :yellow), "Catch a new pokemon".colorize(:color => :yellow), "Release one of your pokemon".colorize(:color => :yellow), "Lucky dip".colorize(:color => :yellow), "Exit".colorize(:color => :yellow)]
      user_input = prompt.enum_select("Main menu:".colorize(:color => :yellow), choices)
      # user_input = gets.chomp.to_i
      case user_input
        when choices[0]
          Pokemon.display_all_pokemon
        when choices[1]
          puts_slow "Alright! Your team is:".yellow.on_blue
          @user.pokemons.pluck(:name).each do |name|
            puts_slow name.colorize(color: :yellow)
          end
        when choices[2]
          @user.battle_pokemon
        when choices[3]
          @user.remove_pokemon_from_team
          @user.reload
        when choices[4]
          @user.lucky_dip
        when choices[5]
          quit
        else
          puts_slow "Sorry! That's not a valid choice. Here are the options again:".yellow.on_blue
          menu
        end
      return_to_menu
    end

    def return_to_menu
      puts_slow "Would you like to return to the menu? Hit enter if yes, otherwise type 'exit' to exit.".yellow.on_blue
        user_input = gets.chomp
        case user_input
        when "exit"
          quit
        else
          menu
        end
    end
end
