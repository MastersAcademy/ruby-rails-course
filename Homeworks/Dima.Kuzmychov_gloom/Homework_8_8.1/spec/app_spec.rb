require File.expand_path '../spec_helper.rb', __FILE__

describe 'Users' do
  it "User should exist" do
    users = User.new
    users.should be_an_instance_of(User)
  end
end

describe 'Posts' do
  it "Post should exist" do
    posts = Post.new
    posts.should be_an_instance_of(Post)
  end
end

describe "Creating of user to db" do
  it "Create user" do
    post '/add_user', {:user_name => 'Dima'}
  end
  it "Check user in db" do
    User.all.first.name.should == 'Dima'
  end
end

describe "Creating of post" do
  it "Check link user post" do
    user_id = User.all.first.id
    get "/:user_id/add_post"
    last_request.url.should == "http://example.org/:user_id/add_post"
  end
  it "Create post" do
    user_id = User.all.first.id
    post "/add_post", {:title => 'Example Post',
                       :content => 'test content'}
  end
  it "Check creating of post" do
    Post.all.first.title.should == 'Example Post'
  end
end

describe "Check all posts of users" do
  it "Show posts" do
    get '/posts'
    last_request.url.should == 'http://example.org/posts'
  end
end
