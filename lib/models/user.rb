class User < ActiveRecord::Base
  has_many :personal_recipes
end
