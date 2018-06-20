class CreateMovesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.integer :pokemon_id
      t.string :name
    end
  end
end
