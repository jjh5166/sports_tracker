class AddPicidToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :picture_id, :integer
  end
end
