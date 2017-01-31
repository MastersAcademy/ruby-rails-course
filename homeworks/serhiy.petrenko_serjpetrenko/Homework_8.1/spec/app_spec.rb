require File.expand_path '../spec_helper.rb', __FILE__

describe "Home page" do
  it "Load the home page" do
    get '/'
    last_response.should be_redirect
    follow_redirect!
    last_request.url.should == 'http://example.org/index'
  end
end

describe "User" do
  it "Checking our user" do
    users = User.new
    users.should be_an_instance_of(User)
  end
end

describe 'Post' do
  it "Checking our post" do
    posts = Post.new
    posts.should be_an_instance_of(Post)
  end
end

describe "Create a new user" do
  it "Create user" do
    post 'user/new', {:username => 'Serj'}
  end
  it "Checking user in db" do
    User.all.first.name.should == 'Serj'
  end
end

describe "Create a new post" do
  it "Show the form for post create" do
    user_id = User.all.first.id
    get "/users/#{user_id}/posts/create"
    last_request.url.should == "http://example.org/users/#{user_id}/posts/create"
  end

  it "Create new user's post" do
    user_id = User.all.first.id
    post "/users/#{user_id}/posts/create", {:title_name => 'Hello',
                                        :body_name => 'Hello world!'}
  end

  it "Checking create of new post" do
    Post.all.first.title.should == 'Hello'
  end
end

describe "Edit user's post" do
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

  it "Check post was edited" do
    Post.all.first.title.should == 'This title was edited'
  end
end

describe "Delete user's post" do
  it "Delete user post" do
    post_id = Post.all.first.id
    user_id = User.all.first.id
    get "/users/#{user_id}/posts/#{post_id}/delete"
    follow_redirect!
    last_request.url.should == "http://example.org/users/#{user_id}"
  end
end

describe "Delete user from db" do
  it "Delete user" do
    user_id = User.all.first.id
    delete "/users/#{user_id}/delete"
  end
end

describe "Show users and posts in json" do
  it "Should return all users in json" do
    get '/users.json'
    last_request.url.should == "http://example.org/users.json"
  end
  it "Should return all posts in json" do
    get '/posts.json'
    last_request.url.should == "http://example.org/posts.json"
  end
end

describe "Show all users" do
  it "Should return all users" do
    get '/users'
    last_request.url.should == "http://example.org/users"
  end
end
