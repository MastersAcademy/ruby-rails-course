require 'sinatra'
require 'sinatra/jbuilder'

require_relative 'app/models/user'
require_relative 'app/models/post'

class App < Sinatra::Application
  set :views, File.expand_path('../app/views', __FILE__)

  # Home
  get '/' do
    redirect '/users'
  end

  # Users
  get '/users.?:format?' do
    @users = User.all

    case params[:format]
      when 'json'
        content_type :json

        jbuilder :'users/index'
      else
        erb :'users/index'
    end
  end

  get '/users/new' do
    erb :'users/new/index'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])

    erb :'users/edit/index'
  end

  get '/users/:id/remove' do
    @user = User.find(params[:id])

    erb :'users/remove/index'
  end

  post '/users' do
    user = User.new

    user.email      = params[:email]
    user.first_name = params[:first_name]
    user.last_name  = params[:last_name]
    user.about      = params[:about]
    user.save

    redirect '/users'
  end

  patch '/users/:id' do
    user = User.find(params[:id])

    user.email      = params[:email]
    user.first_name = params[:first_name]
    user.last_name  = params[:last_name]
    user.about      = params[:about]

    user.save

    redirect '/users'
  end

  delete '/users/:id' do
    user = User.find(params[:id])

    user.destroy

    redirect '/users'
  end

  # Posts
  get '/posts.?:format?' do
    @posts = Post.all

    case params[:format]
      when 'json'
        content_type :json

        jbuilder :'posts/index'
      else
        erb :'posts/index'
    end
  end

  get '/posts/new' do
    @users = User.all

    erb :'posts/new/index'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :'posts/edit/index'
  end

  get '/posts/:id/remove' do
    @post = Post.find(params[:id])

    erb :'posts/remove/index'
  end

  post '/posts' do
    post = Post.new

    post.user_id     = params[:user_id]
    post.title       = params[:title]
    post.description = params[:description]
    post.save

    redirect '/posts'
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])

    post.title       = params[:title]
    post.description = params[:description]
    post.save

    redirect '/posts'
  end

  delete '/posts/:id' do
    post = Post.find(params[:id])

    post.destroy

    redirect '/posts'
  end
end
