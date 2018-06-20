class Recipe < ActiveRecord::Base
  belongs_to :template_recipe
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def initialize()
    @template_recipe_id = get_random_meal_template.id
    set_average_time
  end

  def get_random_meal_template
    TemplateRecipe.all.sample
  end

  def set_average_time
    self.avg_cooking_time = self.template_recipe.avg_cooking_time
  end

  def set_instructions
    self.instruction = self.template_recipe.instructions
  end

  def get_random_ingredient(ingredient_type)

  end

  def get_ingredients
    ingredient_requirement = template_recipe.ingredient_requirement

    g = ingredient_requirement[:grains]
    s = ingredient_requirement[:proteins]
    v = ingredient_requirement[:vegetables]

    self.ingredients = []

    g.times do
      

  end

end
