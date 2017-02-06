require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'

require_relative 'app/models/user'
require_relative 'app/models/post'

# Home
get '/' do
  p 'Index'

  @users = User.all
  @posts = Post.all

  erb :'index'
end

# API
get '/api/users' do
  users = User.all

  content_type('json')

  users.to_json
end

put '/api/users' do
  user = User.new

  user.email = params[:email]
  user.first_name = params[:first_name]
  user.last_name = params[:last_name]
  user.bio = params[:bio]
  user.save
end

patch '/api/users/:id' do
  id = params[:id]

  user = User.find(id)
  user.email = params[:email]
  user.first_name = params[:first_name]
  user.last_name = params[:last_name]
  user.bio = params[:bio]
  user.save
end

delete '/api/users/:id' do
  id = params[:id]

  user = User.find(id)

  user.destroy
end

get '/api/posts' do
  posts = Post.all

  content_type('json')

  posts.to_json
end

put '/api/posts' do
  post = Post.new

  post.user_id = params[:user_id]
  post.title = params[:title]
  post.description = params[:description]
  post.save
end

patch '/api/posts/:id' do
  id = params[:id]

  post = Post.find(id)

  post.title = params[:title]
  post.description = params[:description]
  post.save
end

delete '/api/posts/:id' do
  id = params[:id]

  post = Post.find(id)

  post.destroy
end

# Users

get '/users/add' do
  erb :'users/add'
end

get '/users/:user_id/edit' do
  id = params[:user_id]

  @user = User.find(id)

  erb :'users/edit'
end

get '/users/:user_id/remove' do
  id = params[:user_id]

  @user = User.find(id)

  erb :'users/remove'
end

post '/users/add' do
  RestClient.put('http://localhost:4567/api/users', params)

  redirect to('/')
end

post '/users/:user_id/edit' do
  RestClient.patch('http://localhost:4567/api/users/' + params[:user_id], params)

  redirect to('/')
end

post '/users/:user_id/remove' do
  RestClient.delete('http://localhost:4567/api/users/' + params[:user_id])

  redirect to('/')
end

# Posts

get '/posts/add' do
  @users = User.all

  erb :'posts/add'
end

get '/posts/:post_id/edit' do
  id = params[:post_id]

  @post = Post.find(id)

  erb :'posts/edit'
end

get '/posts/:post_id/remove' do
  id = params[:post_id]

  @post = Post.find(id)

  erb :'posts/remove'
end

post '/posts/add' do
  RestClient.put('http://localhost:4567/api/posts', params)

  redirect to('/')
end

post '/posts/:post_id/edit' do
  RestClient.patch('http://localhost:4567/api/posts/' + params[:post_id], params)

  redirect to('/')
end

post '/posts/:post_id/remove' do
  RestClient.delete('http://localhost:4567/api/posts/' + params[:post_id], params)

  redirect to('/')
end
