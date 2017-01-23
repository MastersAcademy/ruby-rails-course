# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require './models/user'
require './models/post'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)

get '/' do
  'Hello Sinatra!'
  erb :index
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users.json' do
  @users = User.all
  content_type :json
  @users.to_json
end

get "/users/:id.?:format?" do
  @user = User.find(params[:id])
  if params[:format] == 'json'
    content_type :json
    @user.to_json
  else
    erb :"users/show"
  end
end

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

get '/users/:user_id/posts' do
  @posts = Post.where(user_id: params[:user_id])
  erb :'posts/index'
end

get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts.json' do
  @posts = Post.all
  content_type :json
  @posts.to_json
end

get '/posts/:id.?:format?' do
  @post = Post.find(params[:id])
  @by = User.find_by_id(@post.user_id)
  if params[:format] == 'json'
    content_type :json
    @post.to_json
  else
    erb :"posts/show"
  end
end

get '/users/:user_id/posts/new' do
  @post = Post.new
  @post.user_id = params[:user_id]
  erb :"posts/new"
end

post '/users/:user_id/posts/create' do
  @post = Post.new(params[:post])
  @post.user_id = params[:user_id]
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :"posts/new"
  end
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"posts/edit"
end

put '/posts/:id' do
  post = Post.find(params[:id])
  if post.update_attributes(params[:post])
    redirect "/posts/#{post.id}"
  else
    erb :"posts/edit"
  end
end

get '/posts/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/posts'
end