class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :bio
      t.string  :url
      t.string  :fb_user_id
      t.integer :auto_accept
      t.integer :profile_privacy
      t.integer :search_privacy
      t.string  :auth_token

      t.timestamps
    end
  end
end
