require 'sinatra/activerecord'

class Post < ActiveRecord::Base
  belongs_to :user
end
