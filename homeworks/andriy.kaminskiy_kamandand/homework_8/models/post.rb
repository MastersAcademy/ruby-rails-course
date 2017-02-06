require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true
end