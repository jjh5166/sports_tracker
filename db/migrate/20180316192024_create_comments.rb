class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string  :game_id
      t.string  :content
      t.timestamps
    end
  end
end
