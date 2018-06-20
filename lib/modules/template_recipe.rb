# Template Recipe
#avg_cooking_time  =  int
#ingredient_requirement = hash
#instruction = hash
class TemplateRecipe < ActiveRecord::Base
  has_many :recipes
end

# attr_accessor :type, :avg_cooking_time, :ingredient_requirement, :instructions

# def initialize(hash)
#   @type = hash[:type]
#   @argument = hash[:avg_cooking_time]
#   @ingredient_requirement = hash[:ingredient_requirement]
#   @instructions = hash[:instructions]
# end
