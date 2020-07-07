class AddingBlobToUserFiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_files, :picture_data, :bytea
  end
end
