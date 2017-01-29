require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'shotgun'
require './models/users'
require './models/posts'

#Operations with users
get '/' do
  redirect to '/index'
end

get '/index' do
  erb :"users/index"
end

get '/users' do
  @users = User.all
  erb :"users/users"
end

get '/users.json' do
  content_type :json
  User.all.to_json
end

get '/user/new' do
  erb :"users/new"
end

post '/user/new' do
  @user = User.new
  @user.name = params[:username]
  if @user.save
    redirect '/users'
  else
    erb :"users/error"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :"/users/user"
end

get '/users/:id/delete' do
  User.find(params[:id]).destroy
  redirect  "/users"
end
#Operations with posts
get '/users/:id/posts/create' do
  @user = User.find(params[:id])
  erb :'/posts/create'
end

post '/users/:id/posts/create' do
  user = User.find(params[:id])
  user.posts.create title: params[:title_name], body: params[:body_text]
  redirect "/users/#{params[:id]}"
end

get '/users/:id/posts/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :'/posts/edit'
end

get '/users/:id/posts/:post_id/delete' do
  @user_id = Post.find(params[:post_id]).user_id
  Post.delete(params[:post_id])
  redirect "/users/#{@user_id}"
end

get '/posts' do
  @users = User.all
  @posts = Post.all
  erb :"posts/posts"
end

get '/posts.json' do
  content_type :json
  Post.all.to_json
end


get '/posts/:id' do
  redirect "/users/#{params[:id]}"
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(title: params[:title_name], body: params[:body_name])
  redirect "/posts/#{@post.user_id}"
end

get '/post/last' do
  @post = Post.last
  erb :"posts/last"
end
