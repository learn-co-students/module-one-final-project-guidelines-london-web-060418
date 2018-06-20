require 'rest-client'
require 'json'
require 'pry'
#
# pokedex = find_pokedex("bulbasaur")



def search_pokedex(pokemon)
  response = RestClient.get "https://pokeapi.co/api/v2/pokedex/1/"
  JSON.parse(response.body)
end

def find_pokemon_in_pokedex(pokemon_name)
  response = RestClient.get "https://pokeapi.co/api/v2/pokemon-species/#{pokemon_name}"
  JSON.parse(response.body)
end


def create_pokemon(name_or_id)
  pokemon = find_pokemon_in_pokedex(name_or_id)
  english_name = pokemon["names"].find { |name| name["language"]["name"] == "en" }
  habitat = pokemon["habitat"]["name"]
  Pokemon.create(name: english_name["name"], pokemon_id: pokemon["id"].to_i, habitat: habitat)
  puts "Created #{english_name["name"]}!"
end

for i in 1..151
  create_pokemon(i)
end
