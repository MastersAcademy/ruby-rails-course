require 'sinatra'
require 'sinatra-active-model-serializers/json'
require './models/user'
require './models/post'
Tilt.register Tilt::ERBTemplate, 'html.erb'

class App < Sinatra::Base

  # method render to html
  def html_erb(template, option={}, locals={})
    render 'html.erb', template, option, locals
  end

  get '/' do
    redirect to '/users'
  end

  # work with users
  get '/users' do
    @users = User.all
    html_erb :'users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    html_erb :'users/info'
  end

  get '/user/new' do
    @user = User.new
    html_erb :'users/new'
  end

  post '/users' do
    @user = User.new(params[:user])
    if @user.save
      redirect "users/#{@user.id}"
    else
      html_erb :'users/new'
    end
  end

  # work with posts
  get '/posts' do
    @posts = Post.all
    html_erb :'posts/index'
  end

  get '/users/:user_id/posts' do
    @posts = Post.where(user_id: params[:user_id])
    html_erb :'posts/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    @author = User.find_by_id(@post.user_id)
    html_erb :'posts/info'
  end


  get '/users/:user_id/posts/new' do
    @post = Post.new
    @post.user_id = params[:user_id]
    html_erb :'posts/new'
  end

  post '/users/:user_id/posts/create' do
    @post = Post.new(params[:post])
    @post.user_id = params[:user_id]
    if @post.save
      redirect "/posts/#{@post.id}"
    else
      html_erb :'posts/new'
    end
  end

  # edit posts
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    html_erb :'posts/edit'
  end

  post '/posts/:id' do
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect "/posts/#{@post.id}"
    else
      html_erb :'posts/edit'
    end
  end

  # delete post
  get '/posts/:id/delete' do
    @post = Post.destroy(params[:id])
    redirect to '/users'
  end

  #delete user
  get '/users/:id/delete' do
    @user = User.destroy(params[:id])
    redirect to '/'
  end
end