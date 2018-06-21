require 'rest-client'
require 'json'
require 'pry'


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
  Pokemon.create(name: english_name["name"], pokeapi_id: pokemon["id"].to_i, habitat: habitat)
  puts "Created #{english_name["name"]}!"
end


def get_pokemon(beginning, ending)
  for i in beginning..ending
    create_pokemon(i)
  end
end


get_pokemon(151, 151)


steven = User.create(name: "Steven")
lucy = User.create(name: "Lucy")
sam = User.create(name: "Sam")
allegra = User.create(name: "Allegra")
marju = User.create(name: "Marju")
hanna = User.create(name: "Hanna")
rishi = User.create(name: "Rishi")
hugo = User.create(name: "Hugo")
louis = User.create(name: "Louis")
gabriel = User.create(name: "Gabriel")
jigar = User.create(name: "Jigar")
dan = User.create(name: "Dan")
