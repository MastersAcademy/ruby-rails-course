require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'
require './models/user'
require './models/post'

before (/.*/) do
  if request.url.match(/.json$/)
    request.accept.unshift('application/json')
    request.path_info = request.path_info.gsub(/.json$/,'')
  end
end
          
get '/' do
  redirect '/users'
end

get '/posts', :provides => [:html, :json] do
  @posts = Post.all
  @users = User.all
  respond_to do |format|
    format.json { @users.to_json }
    format.html { erb :'/posts/index' }
  end
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

get '/users', :provides => [:html, :json] do
  @users = User.all
  respond_to do |format|
    format.json { @users.to_json }
    format.html { erb :'/users/index' }
  end
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

