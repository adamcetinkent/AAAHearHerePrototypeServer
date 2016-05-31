class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer   :for_user_id
      t.integer   :by_user_id
      t.integer   :post_id
      t.integer   :notification_type
      t.timestamp :read_at
      t.timestamp :sent_at
      t.string    :notification_text

      t.timestamps null: false
    end
  end
end
