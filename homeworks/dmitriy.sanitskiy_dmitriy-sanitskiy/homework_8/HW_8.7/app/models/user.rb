class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length: { :in => 2..30 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,
            length: { :in => 3..255 },
            presence: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :age, presence: true
end