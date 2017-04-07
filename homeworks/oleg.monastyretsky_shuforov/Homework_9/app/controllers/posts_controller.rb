class PostsController < ApplicationController
  def index
    @post = Post.all
    respond_to do |format|
      format.html
      format.json { render :json => @post.where(user_id: current_user.id)}
    end
  end

  def edit
    @posts = Post.all
  end
  
  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(current_user.id)
  end
  
end

private
  def post_params
    params.require(:post).permit(:title, :body)
  end
