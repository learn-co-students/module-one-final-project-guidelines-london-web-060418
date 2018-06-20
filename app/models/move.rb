class Move < ActiveRecord::Base
  has_many :pokemon_moves
  has_many :pokmeon, through: :pokemon_moves
end
