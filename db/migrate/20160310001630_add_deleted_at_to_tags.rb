class AddDeletedAtToTags < ActiveRecord::Migration
  def change
    add_column :tags, :deleted_at, :datetime
    add_index :tags, :deleted_at
  end
end
