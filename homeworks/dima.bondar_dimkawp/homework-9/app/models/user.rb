class User < ApplicationRecord
  has_many :posts
  validates :email, uniqueness: true

end
