require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'shotgun'
require 'sinatra/contrib'
require './models/users'
require './models/posts'

before /.*/ do
  if request.url.match(/.json$/)
    request.accept.unshift('application/json')
    request.path_info = request.path_info.gsub(/.json$/,'')
  end
end


#Operations with users
get '/' do
  redirect to '/index'
end

get '/index' do
  erb :"users/index"
end

get '/users', :provides => [:html, :json] do
  @users = User.all
  respond_to do |format|
    format.json { @users.to_json }
    format.html { erb :'/users/users' }
  end
end

get '/user/new' do
  erb :"users/new"
end

post '/user/new' do
  @user = User.new(name: params[:username])
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

delete '/article/:id' do
  @article_object = Article.delete(params[:id])
  redirect to("/")
end

delete '/users/:id/delete' do
  User.find(params[:id]).destroy
  redirect  "/users"
end
#Operations with posts
get '/users/:id/posts/new' do
  @user = User.find(params[:id])
  erb :'/posts/new'
end

post '/users/:id/posts/new' do
  user = User.find(params[:id])
  user.posts.create title: params[:title_name], body: params[:body_text]
  redirect "/users/#{params[:id]}"
end

get '/users/:id/posts/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :'/posts/edit'
end

get '/users/:id/posts/:post_id/delete' do
  @post = Post.find(params[:post_id])
  @post.destroy
  redirect "/users/#{@post.user_id}"
end

get '/posts', :provides => [:html, :json] do
  @posts = Post.all
  @users = User.all
  respond_to do |format|
    format.json { @posts.to_json }
    format.html { erb :'/posts/posts' }
  end
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
