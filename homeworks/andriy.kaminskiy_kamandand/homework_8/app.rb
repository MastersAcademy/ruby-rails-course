require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require 'sqlite3'
require 'json'
require './models/user'
require './models/post'
require 'sinatra/reloader'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)

get '/' do
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

get '/users.html' do
  users_h = '<h4>'
  all_u = User.all
  all_u.each do |user|
    users_h = users_h + "<li>#{user.name}</li><br>"
  end
  content_type 'text/html, :charset => utf-8'
  "#{users_h}"
end

get '/new_u' do
  @user = User.new
  erb :new_u
end

post '/new_u' do
  @user = User.new(params[:user])
  @user.save
  redirect '/users'
end

get '/users/:id/delete' do
  User.find(params[:id]).destroy
  redirect '/users'
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

get '/posts.html' do
  posts_h = '<h4>'
  all_p = Post.all
  all_p.each do |post|
    posts_h = posts_h + "<li>#{post.body}</li><br>"
  end
  content_type 'text/html, :charset => utf-8'
  "#{posts_h}"
end

get '/users/:user_id/u_posts' do
  @posts = Post.where(user_id: params[:user_id])
  erb :u_posts
end

get '/users/:user_id/true/posts/add' do
  @post = Post.new
  @post.user_id = params[:user_id]
  erb :new_p
end

post '/users/:user_id/true/posts/add' do
  @post = Post.new(params[:post])
  @post.user_id = params[:user_id]
  @post.save
  redirect '/users'
end

get '/users/:id/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect '/users'
end

get '/users/:id/posts/:id/delete' do
  Post.find(params[:id]).destroy
  redirect '/users'
end