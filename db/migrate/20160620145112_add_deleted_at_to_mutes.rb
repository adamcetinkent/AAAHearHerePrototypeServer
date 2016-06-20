class AddDeletedAtToMutes < ActiveRecord::Migration
  def change
    add_column :mutes, :deleted_at, :datetime
    add_index :mutes, :deleted_at
  end
end
