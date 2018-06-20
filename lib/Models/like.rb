class Likes <ActiveRecord::Base
  belongs_to :photos
  belongs_to :users  
end
