class CreatePhotoTable < ActiveRecord::Migration[4.2]
  def change
    create_table :photos do |t|
      t.string   :url
      t.string   :caption
      t.datetime :posted_on
      t.integer  :user_id
    end
  end

end
