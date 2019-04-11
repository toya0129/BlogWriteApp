class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :title, presence: true
  validates :user_id, presence: true
  validates :contents, presence: true
end
