require File.expand_path '../spec_helper.rb', __FILE__

describe 'User' do
  it "User should exist" do
    user = User.new
    user.should be_an_instance_of(User)
  end
end

describe 'Posts' do
  it "Post should exist" do
    posts = Post.new
    posts.should be_an_instance_of(Post)
  end
end

describe "Starting of app" do
  it "Redirect to users url" do
    get '/'
    last_response.should be_redirect
    follow_redirect!
    last_request.url.should == 'http://example.org/users'
  end
end

describe "Creating of user to db" do
  it "Create user" do
    post '/users', {:user_name => 'Oleg'}
  end
  it "Chack user in db" do
    User.all.first.name.should == 'Oleg'
  end
end

describe "Chacking json links" do
  it "Get json link of users" do
    get '/users.json'
    last_request.url.should == "http://example.org/users.json"
  end
  it "Get json link of posts" do
    get '/posts.json'
    last_request.url.should == "http://example.org/posts.json"
  end
end

describe "Creating of post" do
  it "Chack link user post" do
    user_id = User.all.first.id
    get "/users/#{user_id}/posts/new"
    last_request.url.should == "http://example.org/users/#{user_id}/posts/new"
  end
  it "Create post" do
    user_id = User.all.first.id
    post "/users/#{user_id}/posts/new", {:title_name => 'first',
                                         :body_name => 'hello'}
  end
  it "Chack creating of post" do
    Post.all.first.title.should == 'first'
  end
end

describe "Chack all posts of users" do
  it "Show posts" do
    get '/posts'
    last_request.url.should == 'http://example.org/posts'
  end
end

describe "User posts link" do
  it "Show posts of user" do
    user_id = User.all.first.id
    get "/users/#{user_id}/posts/show"
    last_request.url.should == "http://example.org/users/#{user_id}/posts/show"
  end
end

describe "Edit post of user" do
  it "Chack post edit link of user" do
    user_id = User.all.first.id
    post_id = Post.all.first.id
    get "/users/#{user_id}/posts/#{post_id}/edit"
    last_request.url.should == "http://example.org/users/#{user_id}/posts/#{post_id}/edit"
  end
  it "Edit post" do
    post_id = Post.all.first.id
    put "/posts/#{post_id}", {:title_name => 'Edited title', :body_name => 'Edited body'}
  end
  it "Chack changes of post" do
    Post.all.first.title.should == 'Edited title'
  end
end

describe "Delete post of user" do
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
    get "/users/#{user_id}/delete"
  end
end
