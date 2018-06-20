require 'rest-client'
require 'json'
require 'pry'

def search_pokedex(pokemon)
  response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{search}"
  JSON.parse(response.body)
end


def get_character_movies_from_api(character_name)
  x = 1
  film_array = []

  while x < 10
    all_characters = RestClient.get("https://pokeapi.co/api/v2/pokedex/#{x}")
    character_hash = JSON.parse(all_characters)

    character_hash["results"].each do |person|
      if person["name"] == character_name
        film_array = person["films"]
      end
    end
    if film_array.length > 0
      get_movie_info(film_array)
      break
    end
      x += 1
    end
    film_array
  end



  def fetch_readable_api_data(next_page)
    all_characters = RestClient.get(next_page)
    JSON.parse(all_characters)
  end

 def search_page_for_character(character_hash, character_name)
   characters_array = character_hash["results"]
   characters_array.find do |character_hash|
     character_hash["name"] == character_name
   end
 end

def get_next_page(character_hash)
    character_hash["next"]
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

get_character_movies_from_api("Lu Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
