class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  mount_uploader :picture, PictureUploader
end
