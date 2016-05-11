class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer   :user_id
      t.integer   :notification_type
      t.integer   :notification_link
      t.timestamp :read_at

      t.timestamps null: false
    end
  end
end
