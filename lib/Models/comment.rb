class Comment <ActiveRecord::Base
  belongs_to :photos
  belongs_to :users


  def get_user
    User.find(self.user_id)
  end

  def get_photo
    Photo.find(self.photo_id)
  end

end
