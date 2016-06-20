class CreateMutes < ActiveRecord::Migration
  def change
    create_table :mutes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
