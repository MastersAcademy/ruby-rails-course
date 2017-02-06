require './app'
require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe 'User' do
  include Rack::Test::Methods

  it 'redirect to user' do
    get '/'
    expect(last_response).to be_redirect
    expect(last_response.location).to include '/users'
  end

  it 'users page' do
    get '/users'
    expect(last_response).to be_ok
  end

  it 'check do user' do
    users = User.new
    users.should be_an_instance_of(User)
  end

  it 'user exists' do
    user_id = User.all.first.id
    get "/user/#{user_id}"
    expect(last_response.body).to include("Nigan Niger")
  end

  it 'user JSON' do
    get '/user.json'
    expect(last_response.content_type).to eq('application/json')
  end

  it 'valid attributes' do
    expect(User.new(first_name: 'Nigan', last_name: 'Niger')).to be_valid
  end


end

RSpec.describe 'Post' do

  it 'redirect to post' do
    get '/'
    expect(last_response).to be_redirect
    expect(last_response.location).to include '/posts'
  end

  it 'posts page' do
    get '/posts'
    expect(last_response).to be_ok
  end

  it 'check do post' do
    posts = Post.new
    posts.should be_an_instance_of(Post)
  end

  it 'post JSON' do
    get '/post.json'
    expect(last_response.content_type).to eq('application/json')
  end
end
