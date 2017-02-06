class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates_presence_of :text
end
