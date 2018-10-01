class CreatePokemonMovesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_moves do |t|
      t.integer :pokemon_id
      t.integer :move_id
    end
  end
end
