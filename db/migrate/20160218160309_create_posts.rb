class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string  :track
      t.decimal :lat
      t.decimal :lon
      t.string  :message
      t.string  :place_name
      t.string  :google_place_id
      t.integer :privacy, :default => 0
      t.decimal :dummy_lat
      t.decimal :dummy_lon

      t.timestamps null: false
    end
  end
end
