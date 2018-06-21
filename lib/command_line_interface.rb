require "pry"

def welcome
  puts "Hello! My name is Professor Oakiron. My, you've grown!"
end

def get_input
  gets.chomp
end

def sign_in
  puts "Please type your username - if you're new, type what you'd like it to be:"
end

def get_username
  @user_response = gets.chomp.downcase
end

def congrats
  puts "Well, you're all signed in now, #{@user_response}. Off you go! Take good care of your pokemon! Hit enter to see your options."
end


def menu
  puts "1. Display all pokemon in the pokedex
        2. View your team
        3. Add a pokemon to your team
        4. Remove a pokemon from your team
        5. Lucky dip

    Please tell me what you'd like to do! Type the number of the task."

    # gets.chomp.downcase
    user_input = gets.chomp
    # binding.pry
    case user_input
    when 1.to_s
      puts "display af"
      display_all_pokemon
    when 2
      method_2
    when 3
      method_3
    when 4
      method_4
    when 5
      lucky_dip
    else
      puts "Sorry! That's not a valid choice."
      menu
    end
end

# def get_next_task
#   @user_input = gets
#   if user_input == 1
#     method_1
#   elsif user_input == 2
#     method_2
#   elsif user_input == 2
#     method_4
#   elsif user_input == 2
#     method_5
#   elsif user_input == 5
#     lucky_dip
#   end
# end

def lucky_dip
    puts "Some pokemon aren't so lucky - no one picks them :( they just want a chance to be somebody's best bud. Surprise! We just added a random pokemon to your team <3"
    # code to do this eg user_pokemon.create(pokemon.random, user.username == @user_response)
end

def display_all_pokemon
  Pokemon.all.each do |pokemon|
    puts pokemon.name
  end
end





# def find_pokemon(name)
#   if Pokemon.all.find { |pokemon| pokemon.name == name}
#     puts pokemon
#   else
#   puts "We can't find that pokemon! Sorry :("
#   end
# end

welcome
sign_in
get_username
congrats
get_input
menu
