class AddHabitatColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :habitat, :string
  end
end
