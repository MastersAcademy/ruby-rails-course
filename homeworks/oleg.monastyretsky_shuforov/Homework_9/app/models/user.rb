class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_secure_password
  
  validates :name, presence: true,
            length: { minimum: 2 }
  validates :password_digest, presence: true,
            length: { minimum: 5 }
end
