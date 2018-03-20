class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", box: "150x150#" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
