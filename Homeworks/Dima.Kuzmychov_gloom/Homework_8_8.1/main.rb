require 'sinatra' 
require 'redcarpet'
require 'rack'
require 'json'
require 'sinatra/activerecord'
require './models/posts'
require './models/users'
require './config/environments'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)


get '/' do
  @title = 'HomeWork_8'
  erb :index
end

get '/users' do
  @users = User.all
  erb :users
end

get '/users.json' do
  @users = User.all
  content_type :json
  @users.to_json
end

get '/add_user' do
  erb :add_user
end

post '/submit_user' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    'Sorry, there was an error!'
  end
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

get '/:user_id' do
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :user_posts
end

get '/:user_id/add_post' do
  @user_id = params[:user_id]
  erb :add_post
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

get '/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :edit_post
end

post '/:post_id/submit_edit_post' do
  @post = Post.find(params[:post_id])
  if @post.update_attributes(params[:post])
    redirect "/#{@post.user_id}"
  else
    'Sorry, there was an error!'
  end
end

get '/:post_id/delete' do
  @post = Post.find(params[:post_id])
  Post.destroy(params[:post_id])
    redirect "/#{(@post.user_id)}"
end


