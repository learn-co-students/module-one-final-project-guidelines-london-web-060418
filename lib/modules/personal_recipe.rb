class PersonalRecipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  after_create :copy_attributes

  def copy_attributes
    self.template_recipe = Recipe.last.template_recipe
    self.instructions = Recipe.last.instructions
    Recipe.last.ingredients.each do |ing|
      RecipeIngredient.create(recipe: self, ingredient: ing)
    end
    self.nutritional_info = Recipe.last.nutritional_info
  end
end
