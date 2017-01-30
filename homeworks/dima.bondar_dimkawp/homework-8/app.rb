# myapp.rb
require 'rspec'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require './models/user'
require './models/post'
require 'sinatra/contrib'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)

get '/' do
  erb :index
end

get '/users' do
  @users = User.all
  erb :"users/index"
end

before /.*/ do
    if request.url.match(/.json$/)
       request.accept.unshift('application/json')
       request.path_info = request.path_info.gsub(/.json$/,'')
         end
  end

get '/post', :provides => [:html, :json] do
  @posts = Post.all
  respond_to do |format|
      format.json { @posts.to_json }
      format.html { erb :'/post/index' }
    end
end

get '/user', :provides => [:html, :json] do
  @users = User.all
  respond_to do |format|
      format.json { @users.to_json }
      format.html { erb :'/user/index' }
    end
end

get "/user/:id" do
  @user = User.find(params[:id])
    erb :"users/show"
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    redirect "/user/#{@user.id}"
  else
    erb :"users/new"
  end
end

get '/user/:user_id/posts' do
  @posts = Post.where(user_id: params[:user_id])
  erb :'posts/index'
end

get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @by = @post.user
erb :"posts/show"
end

get '/user/:user_id/posts/new' do
  @post = Post.new
  @post.user_id = params[:user_id]
  erb :"posts/new"
end

post '/user/:user_id/posts/create' do
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