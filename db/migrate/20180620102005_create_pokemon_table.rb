class CreatePokemonTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokeapi_id
    end
  end
end
