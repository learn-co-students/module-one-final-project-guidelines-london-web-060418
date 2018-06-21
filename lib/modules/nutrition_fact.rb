require 'rest-client'
require 'json'

class NutritionFact < ActiveRecord::Base
  belongs_to :recipe

  def generate_query_string
    ingredient_string = recipe.ingredients.map do |ingredient|
      ingredient.name
    end.join(", ")

    # query_string = "#{ingredient_string}"
    ingredient_string
  end

  def get_data
    url = "https://trackapi.nutritionix.com/v2/natural/nutrients/"
    response = RestClient.post(url, {query: generate_query_string}.to_json, {
      "Content-Type" => "application/json",
      "x-app-id" => keys[:app_id],
      "x-app-key" => keys[:api_key]
    })
    nutrion_hash = JSON.parse(response)
  end


  def get_macro(macro)
    get_data["foods"].map do |food|
      food[macro]
    end.reduce {|a,b| a + b}
  end



  def set_total_macros
    self.protein = get_macro("nf_protein")
    self.carbs = get_macro("nf_total_carbohydrate")
    self.fat = get_macro("nf_total_fat")
  end

  # def update_ingredients_with_measurments
  #   recipe.ingredients.each do |ingredient|
  #     set_ingredient_measurments(ingredient)
  #   end
  #
  # end
  #
  #
  # def set_ingredient_measurments(ingredient)
  #   ingredient.quantity = data["foods"][0]["tags"]["quantity"]
  #   ingredient.serving_unit = data["foods"][0]["serving_weight_grams"]
  # end

end
