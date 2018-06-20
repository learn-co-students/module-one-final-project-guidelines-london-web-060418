class User < ActiveRecord::Base

  # has_many :follows
  # has_many :profiles, through: :follows

  has_many :followings, class_name: "Follow", foreign_key: "follower_id"
  has_many :followeds, class_name: "User", through: :followings

  has_many :subscriptions, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, class_name: "User", through: :subscriptions

  has_many :photos

  has_many :comments
end

# def follow_user(user)
# #add user to following
# self.followings << user
# end
#
# def get_followers
#   @followers
# def
# # Passenger -< Trips >- Driver
#
# has_many :trips
# has_many :drivers, through: :trips
