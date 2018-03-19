class RemoveGameidFromComments < ActiveRecord::Migration[5.1]
  def up
    remove_column :comments, :game_id, :string
  end
end
