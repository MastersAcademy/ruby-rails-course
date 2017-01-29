require 'sinatra/activerecord'
# require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end