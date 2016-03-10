class AddDeletedAtToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :deleted_at, :datetime
    add_index :friendships, :deleted_at
  end
end
