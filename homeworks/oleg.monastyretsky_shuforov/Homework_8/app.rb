require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './models/user'
require './models/post'

get '/' do
  redirect '/users'
end

get '/posts' do
  @posts = Post.all
  @users = User.all
  erb :'/posts/index'
end

get '/users/:id/posts/show' do
  @posts = Post.where(user_id: params[:id])
  erb :'/posts/show'
end

get '/users/:id/posts/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :'/posts/edit'
end

get '/posts/:id' do
  redirect "/users/#{params[:id]}"
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(title: params[:title_name], body: params[:body_name])
  redirect "/posts/#{@post.user_id}"
end

get '/users/:id/posts/:post_id/delete' do
  @user_id = Post.find(params[:post_id]).user_id
  Post.delete(params[:post_id])
  redirect "/users/#{@user_id}"
end

get '/users/:id/posts/new' do
  @user = User.find(params[:id])
  erb :'/posts/new'
end

post '/users/:id/posts/new' do
  user = User.find(params[:id])
  user.posts.create title: params[:title_name], body: params[:body_text]
  redirect "/users/#{params[:id]}"
end

get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :'/users/show'
end

get '/users/:id/delete' do
  User.find(params[:id]).destroy
  redirect :'/users'
end

get '/user/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new
  @user.name = params[:user_name]
  if @user.save
    redirect '/users'
  else
    redirect '/user/new'
  end
  end

