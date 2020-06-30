class CreateUserFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_files do |t|
      t.string  :filename
      t.string  :content_type
      t.binary  :data
      t.timestamps
    end
  end
end
