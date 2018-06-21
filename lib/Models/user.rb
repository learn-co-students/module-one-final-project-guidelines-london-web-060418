require 'Date'
require 'pry'

class User < ActiveRecord::Base

  # ---- User Follow User Relationship -----
  has_many :subscriptions, class_name: "Follow", foreign_key: "follower_id"
  has_many :following_users, through: :subscriptions, source: :followed
  has_many :distributions, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :distributions, source: :follower
  # ----------------------------------------

  has_many :photos
  has_many :comments

  def follow(user)
    self.following_users << user
  end

  def follow_via_username(username_str)
    user = self.find_user(username_str)
    if(user)
      follow_user(user)
    end
  end

  def post_photo(photo)
    self.photos << photo
  end

  def post_via_url(photo_url, caption = "")
    photo = Photo.create(url: photo_url, caption: caption, posted_on: get_date)
    post_photo(photo)
  end

  def add_like_photo(photo)
    like = Like.create(user_id: self.id, photo_id: photo.id)
  end

  def add_comment_to_photo(photo, message)
    comment = Comment.create(user_id: self.id, photo_id: photo.id, message: message, posted_on: get_date)
  end

  def display_feed
    #TODO: et all the photos that the self has posted, and display tem
    #get all the photos that the self has posted, and display tem
    self.photos.each {|photo| puts photo.url }
  end

  def self.find_user(username_str)
    self.find_by(username: username_str)
  end

  def get_date
     Date.today.to_s
  end

  def get_photos_commented_on

  end

  def get_all_likes
    Like.all.select { |like| like.user_id == self.id }
  end

  def get_all_photos_liked
    get_all_likes.map{ |liked_photo| Photo.find(liked_photo.photo_id) }
  end

  def get_photo_count
    self.photos.count
  end

  def get_number_of_photos_liked
    get_all_likes.count
  end

  def get_all_comments
    Comment.all.select { |comment| comment.user_id == self.id }
  end

  def get_number_of_photos_commented_on
    get_all_comments.count
  end

  def get_followers
      #returns people who have followed me
      self.followers
  end

  def get_followed
    #returns ,people we have followed
    self.following_users
  end

  def find_followed_user(username_str)
    follows = get_followed
    follows.all.find { |user| user.username == username_str }
  end

  def show_user_feed(username)
    user_to_display = find_followed_user(username)
    if(user_to_display) then
      photos_of_user_array = Photo.all.select {|photo| photo.user_id = user_to_display.id}
      currentPos = 0
      exit_loop = false
      while(!exit_loop) do
        photo = photos_of_user_array[currentPos]
        Photo.load_image(photo) #Loads the image into the temrinal and loads the photos comments.
        puts "Commands: like, comment, next, previous, exit"
        input = STDIN.gets.chomp
        case input
          when "comment"
            comment = STDIN.gets.chomp
            add_comment_to_photo(photo, comment)
            Photo.load_image(photo)
          when "like"
            add_like_photo(photo)
            Photo.load_image(photo)
          when "next"
            currentPos+=1
          when "previous"
            currentPos-=1
          when "exit"
            exit_loop = true
          else
            puts "Wrong Function: Try Again"
          end
      end
    else
      puts "user not found / followed"
    end
  end

end
