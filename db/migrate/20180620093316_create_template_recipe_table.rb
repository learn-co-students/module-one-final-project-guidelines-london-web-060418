class CreateTemplateRecipeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :template_recipes do |t|
      t.string :meal
      t.integer :avg_cooking_time
      t.string :ingredient_requirement
      t.string :instructions
    end
  end
end
