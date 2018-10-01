class User < ActiveRecord::Base
  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons

  def team
    self.pokemons
  end

  # def add_pokemon
  #   self.pokemons << Pokemon.all.sample
  # end

  AVAILABLE_MOVES = ["Bind", "Fly", "Double Slap", "Egg Bomb", "Headbutt"]

  def move
    puts "Your available moves are:
        1. Bind
        2. Fly
        3. Double Slap
        4. Egg Bomb
        5. Headbutt".colorize(:color => :yellow)
    choice = gets.chomp.to_i
    if !AVAILABLE_MOVES[choice-1]
      puts "Hey! You can't do that move! Try again.".yellow.on_blue
      move
    else
      choice
    end
  end

  def find_pokemon_in_pokedex
    puts "Who would you like to try and catch?".yellow.on_blue
    poke_to_add = Pokemon.find_by(name: gets.chomp.titleize)
    if !poke_to_add
      puts "Not a pokemon. Try again!".yellow.on_blue
      find_pokemon_in_pokedex
    else
      poke_to_add
    end
  end


  def battle_pokemon
    pokemon = find_pokemon_in_pokedex
    puts "A wild #{pokemon.name} appeared!".yellow.on_blue
    puts "Go! #{team.first.name}!".yellow.on_blue
    tap_out = 0
    while true && tap_out < 3
      choice = move
      puts "Use #{AVAILABLE_MOVES[choice-1]}!".yellow.on_blue
      puts "Threw a pokeball.".yellow.on_blue
      puts ".".yellow.on_blue
      sleep(1.seconds)
      puts "..".yellow.on_blue
      sleep(1.seconds)
      puts "...".yellow.on_blue
      sleep(1.seconds)
      if choice == rand(5)
        self.pokemons << pokemon
        puts "Congrats! You've caught #{pokemon.name}! ٩(｡•́‿•̀｡)۶".yellow.on_blue
        break
      else
        puts "Not quite... They're getting weaker, try again!".yellow.on_blue
        tap_out += 1
      end
    end

    puts "Congrats! You've caught #{pokemon.name}! ٩(｡•́‿•̀｡)۶"
    self.pokemons << pokemon

  end



  def remove_pokemon_from_team
    puts "Who would you like to release?".yellow.on_blue
  #   poke_to_remove = Pokemon.find_by(name: gets.chomp.titleize)
  #   about_to_delete = self.user_pokemons.find do |up|
  #
  #     up.pokemon_id == poke_to_remove.id
  #   end
  #
  #   if about_to_delete
  #     about_to_delete.destroy
  #     puts "All done. Enjoy the wild, bud!".yellow.on_blue
  #   else
  #     puts "Hey! (╯°□°）╯︵ ┻━┻  You don't own that pokemon. Try again!".yellow.on_blue
  #   end
  # end

    prompt = TTY::Prompt.new
    choices = self.pokemons.map do |pokemon|
      pokemon.name.colorize(color: :yellow)
    end
    user_input = prompt.enum_select("Who would you like to release?".colorize(:color => :yellow), choices)
    about_to_delete = self.user_pokemons.find do |up|
      up.pokemon.name == user_input.uncolorize
    end
      if about_to_delete
        about_to_delete.destroy
        puts "All done. Enjoy the wild, bud!".yellow.on_blue
      else
        puts "Hey! (╯°□°）╯︵ ┻━┻  You don't own that pokemon. Try again!".yellow.on_blue
      end
  end


  def lucky_dip
    puts "Some pokemon aren't very lucky - no one picks them :( they just want a chance to be somebody's best bud.".yellow.on_blue
    puts ".".yellow.on_blue
    sleep(1.seconds)
    puts "..".yellow.on_blue
    sleep(1.seconds)
    puts "...".yellow.on_blue
    sleep(1.seconds)
    puts "...Surprise! We just added a random pokemon to your team <3".yellow.on_blue
    self.pokemons << Pokemon.all.sample
  end



end
