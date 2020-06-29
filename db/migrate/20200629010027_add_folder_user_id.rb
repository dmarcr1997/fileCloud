class AddFolderUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :folders, :user_id, :integer
  end
end
