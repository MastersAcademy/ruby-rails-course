require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './models/user'
require './models/post'

ActiveRecord::Base.connection

get '/' do
  @@users = User.all.map {|user| user.name}
  erb :index
end

post '/' do
  if params[:user_name].length <= 0 or @@users.include?(params[:user_name])
    'name too short or other user have the same name'
  else
    User.create name: params[:user_name]
    redirect '/'
  end
end

get '/posts' do
  @all_users = User.all
  @all_posts = Post.all
  erb :posts
end

get '/posts.json' do
  content_type :json
  Post.all.to_json  
end

get '/user/:name' do
  @@user_name = params[:name]
  @user_id = User.find_by_name(params['name']).id
  @posts = Post.where(user_id: @user_id)
  erb :user
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
  erb :edit_post
end
