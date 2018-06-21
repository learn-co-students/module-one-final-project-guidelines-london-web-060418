class CreateRecipeDb < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :template_recipe_id
      t.string :name
      t.string :instructions
    end
  end
end
