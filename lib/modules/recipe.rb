class Recipe < ActiveRecord::Base
  belongs_to :template_recipe
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
