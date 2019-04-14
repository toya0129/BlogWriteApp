class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :tweets, dependent: :destroy

  validates :name, presence: true
  validates :password, presence: true
end
