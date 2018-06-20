class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def get_photo_comments
    Comment.all.select{|comment| comment.photo_id == self.id}
  end

  def get_likes
    Like.all.select{|like| like.photo_id == self.id}
  end

  def get_like_count
    get_likes.count
  end

  def get_comment_count

  end

end
