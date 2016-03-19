class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :fb_user_id
      t.integer :auto_accept

      t.timestamps
    end
  end
end