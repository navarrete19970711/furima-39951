class RenameCommentColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :comment, :explain
  end
end
