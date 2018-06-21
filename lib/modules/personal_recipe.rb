class PersonalRecipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  delegate :avg_cooking_time, to: :template_recipe

  after_create :copy_attributes

  def copy_attributes
    self.template_recipe_id = Recipe.last.template_recipe_id
    self.instructions = Recipe.last.instructions
    Recipe.last.ingredients.each do |ing|
      RecipeIngredient.create(personal_recipe: self, ingredient: ing)
    end
    # NUTRITION FACT
  end
end
