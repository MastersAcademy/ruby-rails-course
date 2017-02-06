require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './config/environments'
require './models/user'
require './models/post'
require 'sinatra/contrib'

before /.*/ do
  if request.url.match(/.json$/)
    request.accept.unshift('application/json')
    request.path_info = request.path_info.gsub(/.json$/, '')
  end

  if request.url.match(/.html$/)
    request.accept.unshift('application/html')
    request.path_info = request.path_info.gsub(/.html$/, '')
  end
end

get '/' do
  erb :index
end

get '/users', :provides => [:html, :json] do
  @users = User.all
  erb :users

  respond_to do |format|
    format.html { erb :users }
    format.json { @users.to_json }
  end
end

get '/add_user' do
  erb :add_user
end

get '/posts', :provides => [:html, :json] do
  @posts = Post.all
  erb :posts

  respond_to do |format|
    format.html { erb :posts }
    format.json { @posts.to_json }
  end
end

get '/:user_id/add_post' do
  @user_id = params[:user_id]
  erb :add_post
end

get '/:user_id', :provides => [:html, :json] do
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :user_posts

  respond_to do |format|
    format.html { erb :user_posts }
    format.json { @posts.to_json }
  end
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
