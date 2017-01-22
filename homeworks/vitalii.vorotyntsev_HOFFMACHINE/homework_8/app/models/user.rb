require 'sinatra/activerecord'

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
end
