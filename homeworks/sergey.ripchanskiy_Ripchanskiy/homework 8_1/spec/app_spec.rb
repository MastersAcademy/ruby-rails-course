require './app.rb'
require 'rack/test'
require 'rspec'

set :environment, :test

describe 'App tests' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Checking our user" do
    users = User.new
    users.should be_an_instance_of(User)
  end

  it "should load users page" do
    get '/users'
    expect(last_response).to be_ok
  end

  it "displays posts page" do
    get 'posts/index'
    expect(last_response.body).to include("Posts")
  end

  it "displays user page if a user exists" do
    user_id = User.all.first.id
    get "/users/#{user_id}"
    expect(last_response.body).to include("Nick's Posts")
  end

  it 'displays posts as JSON' do
    get '/posts.json'
    expect(last_response.content_type).to eq('application/json')
  end

  it "Create new user's post" do
    user_id = User.all.first.id
    post "/users/#{user_id}/posts/create", {:title_name => 'New Post',
                                         :body_name => 'Hi there!'}
  end

  it "Show user's post for edit" do
    user_id = User.all.first.id
    post_id = Post.all.first.id
    get "/users/#{user_id}/posts/#{post_id}/edit"
    last_request.url.should == "http://example.org/users/#{user_id}/posts/#{post_id}/edit"
  end

  it "Should edit post" do
    post_id = Post.all.first.id
    put "/posts/#{post_id}", {:title_name => 'This title was edited', :body_name => 'This body was edited'}
  end

  it 'is valid with valid attributes' do
    expect(User.new(name: 'Sanya', surname: 'Stanov', email: 'sanya@gmail.com')).to be_valid
  end
end