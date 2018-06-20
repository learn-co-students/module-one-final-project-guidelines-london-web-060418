class CreateCommentTable < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.string    :message
      t.integer   :user_id
      t.integer   :photo_id
      t.datetime :posted_on
    end
  end
end
