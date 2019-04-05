class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :articles
  has_many :follows
  has_many :tweets
end
