require 'sinatra'
require 'sinatra/activerecord'
require 'redcarpet'
require 'sinatra/respond_to'
require 'respond_to'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/app')
require 'models/user'
require 'models/post'
require 'routes'
# require 'helpers'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/config')

get '/' do
  @users = User.all
  erb :'users/index'
end

get '/users/:id/' do
  @user = User.find(params[:id])
  @name = @user.name
  @email = @user.email
  @age = @user.age
  @posts = @user.posts
  erb :'users/show'
end

get '/users/new' do
  @title = 'Create new user'
  erb :'users/create'
end

post '/users/new' do
  params.delete 'submit'
  @user = User.create(params)
  # respond_to do |format|
  #   if @user.save
  #     format.html { redirect :'/', notice: 'User was successfully created.' }
  #     format.json { @user.to_json }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @user.errors, status: :unprocessable_entity }
  #   end
  # end
  if @user.save
    redirect '/'
  else
    'User was not save'
  end
end

get '/users/:id/edit' do
  @title = 'Update user'
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id/edit' do
  @user = User.find(params[:id])
  if @user.update_attributes(name: params[:name],
                             email: params[:email],
                             age: params[:age])
    redirect '/'
  else
    erb :'users/edit'
  end
end

get '/users/:id/delete/' do
  @title = "Confirm deletion of user #{params[:id]}"
  @user = User.find(params[:id])
  erb :'users/delete'
end

delete '/users/:id/' do
  User.find(params[:id]).destroy
  redirect to '/'
end


get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

# get '/users/:user_id/posts/show_all' do
#   @user = User.find(params[:id])
#   @posts = Post.where(user_id: params[:id])
#   erb :'/posts/show_all'
# end

get '/users/:id/posts/new' do
  @user = User.find(params[:id])
  @title = 'Create new post'
  erb :'posts/create'
end

#
post '/users/:id/posts/new/' do

  params.delete 'submit'
  @user = User.find(params[:id])
  @user.posts.create title: params[:title],
                    body: params[:body]
  redirect "/users/#{params[:id]}/"
  # respond_to do |format|
  #   if @user.save
  #     format.html { redirect :'/', notice: 'User was successfully created.' }
  #     format.json { @user.to_json }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @user.errors, status: :unprocessable_entity }
  #   end
  # end
end
#
# get 'users/:id/posts/:id/edit' do
#   @title = 'Update post'
#   @post = Post.find(user_id: params[:id])
#   erb :'posts/edit'
# end
#
get '/users/:id/posts/:post_id/edit' do
  @post = Post.find(params[:post_id])
  @user = @post.user
  erb :'/posts/edit'
end

put '/users/:user_id/posts/:id/edit' do
  @post = Post.find(params[:id])
  @post.update_attributes(title: params[:title], body: params[:body])
  redirect "/users/#{params[:user_id]}/"
end

# get '/users/:user_id/posts/:id/delete/' do
#   @title = "Confirm deletion of post #{params[:id]}"
#   @post = Post.find(params[:id])
#   erb :'posts/delete'
# end

delete '/users/:user_id/posts/:id/' do
  @user = User.find(params[:user_id])
  # @post = @user.posts.find(params[:id]).delete
  # Post.find(params[:id]).destroy
  # @posts.find(params[:id]).destroy

  @post = @user.posts.find_by(id: params[:id])
  @post.destroy

  redirect "/users/#{@user_id}"
end

not_found do
  @title = 'Page not found'
  # создайте для неё шаблон 404.erb
  erb :'404'
end

error do
  @error = request.env['sinatra_error'].name
  erb :'500'
end