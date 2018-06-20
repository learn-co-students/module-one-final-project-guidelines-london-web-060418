class CreateFollowTable < ActiveRecord::Migration[4.2]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id
    end
  end
end
