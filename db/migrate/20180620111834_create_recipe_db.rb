class CreateRecipeDb < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :template_recipe_id
      t.string :ingredients
      t.string :instructions
      t.string :nutritional_info
    end
  end
end
