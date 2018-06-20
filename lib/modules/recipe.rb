class Recipe < ActiveRecord::Base
  belongs_to :template_recipe
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  delegate :avg_cooking_time, to: :template_recipe

  after_create :set_attributes

  #INITIALIZATION METHODS

  def set_attributes
    self.template_recipe = TemplateRecipe.all.sample
    self.instructions = self.template_recipe.instructions
    get_ingredients
    self.save
  end

  def get_ingredient_by_type(ingredient_type)
    Ingredient.all.select { |ing| ing.category == ingredient_type }.sample
  end

  def generate_recipe_ingredient_X_times(category, number)
    number.times do
      RecipeIngredient.create(recipe: self, ingredient: get_ingredient_by_type(category))
    end
  end

  def get_ingredients
    requirements = JSON.parse(self.template_recipe.ingredient_requirement)

    grain_amount = requirements["grains"]
    protein_amount = requirements["proteins"]
    veg_amount = requirements["veg"]
    
    requirements["base_ingredients"].each do |ing|
      ingredient = Ingredient.find_by(name: ing)
      RecipeIngredient.create(recipe: self, ingredient: ingredient)
    end

    generate_recipe_ingredient_X_times("grain", grain_amount)
    generate_recipe_ingredient_X_times("protein", protein_amount)
    generate_recipe_ingredient_X_times("veg", veg_amount)
  end
end
