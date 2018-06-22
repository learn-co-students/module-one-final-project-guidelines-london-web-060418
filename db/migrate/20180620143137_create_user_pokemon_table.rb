class CreateUserPokemonTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pokemons do |t|
      t.integer :pokemon_id
      t.integer :user_id
      t.string :name
    end
  end
end
