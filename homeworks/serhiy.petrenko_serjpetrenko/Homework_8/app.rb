require 'sinatra'
require 'sinatra/activerecord'
require './models/user'
require './models/post'
require 'json'
require 'shotgun'

ActiveRecord::Base.connection



get '/' do
  erb :"users/index"
end

get '/create_user' do
  erb :"users/create"
end

post '/create_user' do
  user = User.new
  if params[:user_name].length > 0
    user.name = params[:user_name]
    user.save
    redirect '/all_users'
  else
    erb :"users/failed"
  end
end


get '/all_users' do
  @@users = User.all.map { |user| user.name }
  erb :"users/all_users"
end

get '/posts' do
  @all_users = User.all
  @all_posts = Post.all
  erb :"posts/posts"
end

get '/posts.json' do
  content_type :json
  Post.all.to_json
end

get '/last_post' do
  @last_post = Post.last
  erb :"posts/last_post"
end

get '/user/:name' do
  @@user_name = params[:name]
  @user_id = User.find_by_name(params['name']).id
  @posts = Post.where(user_id: @user_id)
  erb :"users/user"
end

get '/users.json' do
  content_type :json
  User.all.to_json
end

get '/delete_post/:id' do
  Post.destroy(params[:id])
  redirect "/user/#{@@user_name}"
end

get '/create_post' do
  redirect "/user/#{@@user_name}"
end

post '/create_post' do
  user = User.find_by_name(@@user_name)
  user.posts.create title: params[:title_name], body: params[:body_text]
  redirect "/user/#{@@user_name}"
end

get '/edit_post' do
  Post.where(id: @@post_id).update(title: params[:title_name])
  Post.where(id: @@post_id).update(body: params[:body_name])
  redirect "/user/#{@@user_name}"
end

get '/edit_post/:id' do
  @@post_id = params[:id]
  @edit_title = Post.where(id: @@post_id).first.title
  @edit_text = Post.where(id: @@post_id).first.body
  erb :"posts/edit"
end
