class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
end
