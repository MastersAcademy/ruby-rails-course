require 'active_record'

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
end
