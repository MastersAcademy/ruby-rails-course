class Post < ApplicationRecord
  belongs_to :user # don't including password rows
  validates :title, presence: true
  validates :body, presence: true
end
