class CreateLikeTable<ActiveRecord::Migration
  def change
    create_table  :likes do |t|
      t.integer   :user_id
      t.integer   :photo_id
    end
  end
end
