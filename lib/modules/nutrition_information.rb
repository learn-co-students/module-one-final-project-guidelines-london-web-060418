require 'rest-client'

class NutritionFact < ActiveRecord::Base
  # belongs_to :recipe
  #
  # def generate_query_string
  #   recipe.ingredients.map do |ingredient|
  #     ingredient.name
  #   end.join(",")
  # end
  #
  # def generate_url
  #   url = "https://trackapi.nutritionix.com/v2/natural/nutrients/"
  #
  #   RestClient.post(url, query_string ,headers={"Content-Type" => "application/json",
  #     "x-app-id" => "e9b0130f",
  #     ":x-app-key" => "4c0a16bd2267c3640d1917a1d3438fca"},
  #
  #     )
  #
  #   url = "https://trackapi.nutritionix.com/v2/natural/nutrients/#{generate_query_string}&appId=e9b0130f&appKey=4c0a16bd2267c3640d1917a1d3438fca"
  # end
  #
  # def get_data
  #
  #  response = HTTParty.get(generate_url)
  #  json = JSON.parse(@response.body)
  #
  # end
  #

end
