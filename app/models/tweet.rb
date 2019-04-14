class Tweet < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :contents, presence: true
end
