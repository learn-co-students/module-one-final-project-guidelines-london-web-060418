class Pokemon < ActiveRecord::Base
  has_many :user_pokemons
  has_many :users, through: :user_pokemons

  def self.display_all_pokemon
    Pokemon.all.each do |pokemon|
      puts pokemon.name
    end
  end

end
