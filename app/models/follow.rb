class Follow < ApplicationRecord
  belongs_to :user, optional: true

  validates :following_id, presence: true
  validates :follower_id, presence: true
end
