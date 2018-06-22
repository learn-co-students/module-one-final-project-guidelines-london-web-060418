class CreatePersonalRecipesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_recipes do |t|
      t.integer :user_id
      t.integer :template_recipe_id
      t.string :name
      t.string :instructions
    end
  end
end
