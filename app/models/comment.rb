class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :picture_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length:{ in: 2..150}
end
