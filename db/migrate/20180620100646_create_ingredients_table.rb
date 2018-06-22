class CreateIngredientsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :category
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.string :serving_unit
      t.string :quantity
    end
  end
end
