class DeleteImageFromUser < ActiveRecord::Migration[5.1]
  def down
    remove_column :users, :avatar_file_name, :string
    remove_column :users, :avatar_content_type, :string
    remove_column :users, :avatar_file_size, :integer
    remove_column :users, :avatar_updated_at, :datetime

  end
end
