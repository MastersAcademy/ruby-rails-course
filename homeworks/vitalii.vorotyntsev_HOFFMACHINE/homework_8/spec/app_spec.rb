require 'spec_helper'

describe App do
  describe 'Home page' do
    it 'should redirect to the users page' do
      get '/'

      follow_redirect!

      expect(last_request.path).to eq('/users')
    end
  end

  describe 'Users page' do
    it 'should allow accessing' do
      get '/users'

      expect(last_response).to be_ok
      expect(last_response.body).to include('List of users')
    end

    it 'responds with JSON' do
      get '/users.json'

      expect(last_response.content_type).to eq('application/json')
    end

    it 'should allow create a new' do
      get '/users/new'

      expect(last_response.body).to include('Add new user')
    end

    it 'creating a new' do
      post '/users', :email => 'test@example.com', :first_name => 'Test first name', :last_name => 'Test last name'

      expect(User.count).not_to eq(0)

      follow_redirect!

      expect(last_request.path).to eq('/users')
    end
  end

  describe 'Posts page' do
    it 'should allow accessing' do
      get '/posts'

      expect(last_response).to be_ok
      expect(last_response.body).to include('List of posts')
    end

    it 'responds with JSON' do
      get '/users.json'

      expect(last_response.content_type).to eq('application/json')
    end

    it 'should allow create a new' do
      get '/posts/new'

      expect(last_response.body).to include('Add new post')
    end

    it 'creating a new' do
      count = Post.count

      post '/posts', :user_id => 1, :title => 'Test title', :description => 'Test description'

      expect(Post.count).not_to eq(count)

      follow_redirect!

      expect(last_request.path).to eq('/posts')
    end
  end
end
