require 'Catpix'
require 'open-uri'

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


  def self.show_image_catpix(image_name = "")
    image_location = "./lib/Images/#{image_name}"

    image_buffer = Catpix::get_image_buffer image_location,
      :limit_x => 1,
      :limit_y => 0,
      :center_x => false,
      :center_y => false,
      :bg => "white",
      :bg_fill => false,
      :resolution => "high"

      print "#{image_buffer}"
  end

  def self.clear_images_directory
    puts "Clearing Images Directory..."
    FileUtils.rm_r Dir.glob('./lib/Images/*')
    puts "...Cleared Images Directory."
  end

  def self.get_image_from_url(url)

    puts "Loading Image From Url #{url} ..."
    extension = url.split('.').last
    file_name = "image_#{Time.now.strftime("%Y-%m-%d%H%M%S")}.#{extension}"
    file = File.write "./lib/Images/#{file_name}", open(url).read
    if(file)
      puts "Successfully found image."
      return file_name
    else
      puts "Image Not Found From Url:"
      puts "#{url}"
    end
  end

  def self.load_image(photo)
    #download and store the image into the local directory.
    self.clear_images_directory
    local_photo = Photo.get_image_from_url(photo.url)
    #Display the image on the terminal

    rows = []
    table = Terminal::Table.new do |t|
      t << ['LIKES']
      t << :separator
      t << ["You have: #{photo.get_like_count} Likes"]

      t << :separator
      t << :separator

      t.add_row ['COMMENTS']
      t << :separator
      photo.get_photo_comments.each do |comment|
        t << ["#{comment.get_user.username} :: #{comment.message}"]
      end
      t << :separator
      t << :separator
    end
    show_image_catpix(local_photo)
    puts table

  end


end
