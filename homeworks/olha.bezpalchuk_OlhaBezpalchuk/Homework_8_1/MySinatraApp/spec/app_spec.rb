require './app.rb'
require 'rack/test'
require 'rspec'

RSpec.configuration.expect_with(:rspec) do |c|
  c.syntax = :should
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

describe 'My Sinatra App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'displays home page' do
    get '/'

    last_response.should be_ok
    last_response.body.should include 'For The Empire!'
  end

  it 'displays list of users' do
    get '/users'

    last_response.should be_ok
    last_response.body.should include 'All Users'
  end

  it 'provides json format for users' do
    get '/users.json'

    last_response.should be_ok
    last_response.content_type.should eq('application/json')
  end

  it 'provides html format for users' do
    get '/users.html'

    last_response.should be_ok
    last_response.content_type.should eq('text/html;charset=utf-8')
    last_response.body.should include 'All Users'
  end

  it 'displays all posts' do
    get '/posts'

    last_response.should be_ok
    last_response.body.should include 'All Posts'
  end

  it 'provides json format for posts' do
    get '/posts.json'

    last_response.should be_ok
    last_response.content_type.should eq('application/json')
  end

  it 'provides html format for posts' do
    get '/posts.html'

    last_response.should be_ok
    last_response.content_type.should eq('text/html;charset=utf-8')
    last_response.body.should include 'All Posts'
  end

  it 'provides json format for any user' do
    users = User.all

    users.each do |user|
      get "/#{user.id}.json"
      last_response.should be_ok
      last_response.content_type.should eq('application/json')
    end
  end

end

