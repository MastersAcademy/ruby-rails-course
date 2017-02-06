class PostsController < ApplicationController
# GET '/users/:user_id/posts'
  def index
    @posts = Post.all
  end

# GET '/posts/new'
  def new
    flash[:logged_in] = User.get_user_for_token(session[:auth_token]) != nil
  end

# POST '/posts'
  def create
    @post = Post.new
    @post.title = params[:posts][:title]
    @post.body = params[:posts][:body]

     if @user = User.get_user_for_token(session[:auth_token])
       @post.user_id = @user.id
       @post.save
     end

    redirect_to '/posts/index'
  end

# GET '/user/:user_id/post/:id'
  def show

  end

# GET '/post/:id/edit'
  def edit
  end

# PUT '/posts/:id'
  def update
  end

# DELETE '/posts/:id'
  def destroy
  end
end
