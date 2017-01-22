require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './config/environments'
require './models/user'
require './models/post'

get '/' do
  erb :index
end

get '/users' do
  @users = User.all
  erb :users
end

get '/add_user' do
  erb :add_user
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/posts.json' do
  @posts = Post.all
  content_type :json
  @posts.to_json
end

get '/users.json' do
  @users = User.all
  content_type :json
  @users.to_json
end

get '/:user_id/add_post' do
  @user_id = params[:user_id]
  erb :add_post
end

get '/:user_id' do
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :user_posts
end

get '/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :edit_post
end

post '/submit_user' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    'Sorry, there was an error!'
  end
end

post '/:user_id/submit_post' do
  @posts = Post.new(params[:post])
  @posts.user_id = params[:user_id]
  if @posts.save
    redirect "/#{@posts.user_id}"
  else
    'Sorry, there was an error!'
  end
end

post '/:post_id/submit_edit_post' do
  @post = Post.find(params[:post_id])
  if @post.update_attributes(params[:post])
    redirect "/#{@post.user_id}"
  else
    'Sorry, there was an error!'
  end
end
