class CreateFollowRequests < ActiveRecord::Migration
  def change
    create_table :follow_requests do |t|
      t.integer :user_id
      t.integer :requested_user_id

      t.timestamps null: false
    end
  end
end
