# require 'pry'
#
# class Pokemon < ActiveRecord::Base
#   has_many :moves, through: :skillset
#
#   def find_last_pokemon
#     Pokemon.all.max_by do |pokemon|
#       pokemon.pokemon_id
#       binding.pry
#     end
#   end
#
#   def find_pokemon(name)
#     if Pokemon.all.find { |pokemon| pokemon.name == name}
#     else
#     puts "We can't find that pokemon! Sorry :("
#     end
#   end
#
#
#
# end

class Pokemon < ActiveRecord::Base
  has_many :user_pokemons
  has_many :users, through: :user_pokemons
end
