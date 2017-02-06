require 'spec_helper'

describe 'work with user' do
  it 'should create user' do
    @user = User.new(:id => 1, :name => 'Name')
    expect(@user.id).to eq(1)
    expect(@user.name).to eq('Name')
  end

  it 'should redirect to the users page' do
    get '/'
    follow_redirect!
    expect(last_request.path).to eq('/users')
  end

  context 'status test user' do
    it 'returns 200 status' do
      get '/users'
      expect(last_response.status).to eq 200
    end
  end

  it 'should allow create a new' do
    get '/users/new'
    expect(last_response.body).to include('Add new user')
  end
end

describe 'post' do
  it 'should check user id' do
    @post = Post.new(:user_id => 1)
    expect(@post.user_id).to eq(1)
  end

  it 'should create a new post' do
    get '/posts/new'
    expect(last_response.body).to include('Add new post')
  end

  context 'status test posts'  do
    it 'returns 200 status' do
      get '/posts'
      expect(last_response.status).to eq 200
    end
  end
end