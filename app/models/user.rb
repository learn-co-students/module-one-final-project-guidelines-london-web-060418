class User < ActiveRecord::Base
  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons

  def team
    self.pokemons
  end

  AVAILABLE_MOVES = ["Bind", "Fly", "Double Slap", "Egg Bomb", "Headbutt"]

  def move
    puts "Your available moves are:
        1. Bind
        2. Fly
        3. Double Slap
        4. Egg Bomb
        5. Headbutt"
    choice = gets.chomp.to_i
    if !AVAILABLE_MOVES[choice-1]
      puts "Hey! You can't do that move! Try again."
      move
    else
      choice
    end
  end

  def find_pokemon_in_pokedex
    puts "Who would you like to try and catch?"
    poke_to_add = Pokemon.find_by(name: gets.chomp.titleize)
    if !poke_to_add
      puts "Not a pokemon. Try again!"
      find_pokemon_in_pokedex
    else
      poke_to_add
    end
  end


  def battle_pokemon
    pokemon = find_pokemon_in_pokedex
    puts "A wild #{pokemon.name} appeared!"
    puts "Go! #{team.first.name}!"
    while true
      choice = move
      puts "Use #{AVAILABLE_MOVES[choice-1]}!"
      puts "Threw a pokeball."
      puts "."
      sleep(1.seconds)
      puts ".."
      sleep(1.seconds)
      puts "..."
      sleep(1.seconds)
      if choice == rand(5)
        self.pokemons << pokemon
        puts "Congrats! You've caught #{pokemon.name}! ٩(｡•́‿•̀｡)۶"
        break
      else
        puts "Not quite... They're getting weaker, try again!"
      end
    end
  end



  def remove_pokemon_from_team
    puts "Who would you like to release?"
    poke_to_remove = Pokemon.find_by(name: gets.chomp.titleize)
    about_to_delete = self.user_pokemons.find do |up|

      up.pokemon_id == poke_to_remove.id
    end

    if about_to_delete
      about_to_delete.destroy
      @user = User.find(self.id)
      puts "All done. Enjoy the wild, bud!"
    else
      puts "Hey! (╯°□°）╯︵ ┻━┻  You don't own that pokemon. Try again!"
    end
  end



  def lucky_dip
    puts "Some pokemon aren't very lucky - no one picks them :( they just want a chance to be somebody's best bud."
    sleep(2.seconds)
    puts "..."
    sleep(2.seconds)
    puts "...Surprise! We just added a random pokemon to your team <3"
    self.pokemons << Pokemon.all.sample
  end



end
