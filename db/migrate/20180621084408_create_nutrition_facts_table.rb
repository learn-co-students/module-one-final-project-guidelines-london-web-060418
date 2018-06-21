class CreateNutritionFactsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :nutrition_facts do |t|
      t.integer :recipe_id
      t.integer :protein
      t.integer :carbs
      t.integer :fat
    end
  end
end
