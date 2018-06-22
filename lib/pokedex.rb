require 'rest-client'
require 'json'
require 'pry'

def search_pokedex(pokemon)
  response = RestClient.get "https://pokeapi.co/api/v2/pokedex/1/"
  JSON.parse(response.body)
end

def find_pokedex(pokemon_name)
  response = RestClient.get "https://pokeapi.co/api/v2/pokemon-species/#{pokemon_name}"
  JSON.parse(response.body)
end

def find_pokemon(name)
  Set.all.find do |pokemon|
    pokemon.name == pokemon
  end
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
