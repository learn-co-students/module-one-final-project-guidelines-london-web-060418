class CreateIngredientsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type
      t.integer :protein
      t.integer :carbs
      t.integer :fat
    end
  end
end
