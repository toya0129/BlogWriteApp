class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :article_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true
end
