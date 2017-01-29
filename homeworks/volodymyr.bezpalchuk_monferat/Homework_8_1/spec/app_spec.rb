require './app.rb'
require 'rack/test'
require 'rspec'

set :environment, :test

describe 'App tests' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should load users page" do
    get '/users'
    expect(last_response).to be_ok
  end

  it "should redirect to /users" do
    get '/'
    expect(last_response).to be_redirect
    expect(last_response.location).to include '/users'
  end

  it "displays posts page" do
    get '/posts'
    expect(last_response.body).to include("Posts")
  end

  it "displays user page if a user exists" do
    user_id = User.all.first.id
    get "/users/#{user_id}"
    expect(last_response.body).to include("Maria's Posts")
  end

  it 'displays posts as JSON' do
    get '/posts.json'
    expect(last_response.content_type).to eq('application/json')
  end

  it 'is valid with valid attributes' do
    expect(User.new(name: 'Anna', surname: 'Merolle', email: 'anna@mail.com')).to be_valid
  end

  it 'displays user name if a user exists' do
    post '/users',  :name => 'Anna'
    expect(last_response.body).to include("Anna")
  end
end