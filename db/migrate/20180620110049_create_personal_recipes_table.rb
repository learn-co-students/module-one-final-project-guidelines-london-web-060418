class CreatePersonalRecipesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_recipes do |t|
      t.integer :template_recipe_id
      t.string :name
      t.integer :avg_cooking_time
      t.string :instructions
    end
  end
end
