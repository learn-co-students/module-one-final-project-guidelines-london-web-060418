class CreatePersonalRecipesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_recipes do |t|
      t.integer :avg_cooking_time
      t.string :ingredients
      t.string :instructions
      t.string :nutritional_info
    end
  end
end
