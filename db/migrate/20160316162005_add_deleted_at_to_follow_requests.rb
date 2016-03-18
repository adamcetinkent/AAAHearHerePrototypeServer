class AddDeletedAtToFollowRequests < ActiveRecord::Migration
  def change
    add_column :follow_requests, :deleted_at, :datetime
    add_index :follow_requests, :deleted_at
  end
end
