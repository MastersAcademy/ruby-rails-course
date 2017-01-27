require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './models/user'
require './models/post'
require './config/environment'

get '/' do
  erb :index
end

# Get the all users
get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users.json' do
  @users = User.all
  content_type :json
  @users.to_json
end

get '/users/:id.?:format?' do
  @user = User.find(params[:id])
  if params[:format] == 'json'
    content_type :json
    @user.to_json
  else
    erb :"users/show"
  end
end

# Add new user
get '/user/new' do
  @user = User.new
  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :"users/new"
  end
end

# Get all posts
get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts.json' do
  @posts = Post.all
  content_type :json
  @posts.to_json
end

get '/users/:user_id/posts' do
  @posts = Post.where(user_id: params[:user_id])
  erb :'posts/index'
end

# Get the post with the specific id
get '/posts/:id.?:format?' do
  @post = Post.find(params[:id])
  @author = User.find_by_id(@post.user_id)
  if params[:format] == 'json'
    content_type :json
    @post.to_json
  else
    erb :"posts/show"
  end
end

# Add new post
get '/users/:user_id/posts/new' do
  @post = Post.new
  @post.user_id = params[:user_id]
  erb :"posts/new"
end

post "/users/:user_id/posts/create" do
  @post = Post.new(params[:post])
  @post.user_id = params[:user_id]
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :"posts/new"
  end
end

#edit post
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"posts/edit"
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect "/posts/#{@post.id}"
  else
    erb :"posts/edit"
  end
end