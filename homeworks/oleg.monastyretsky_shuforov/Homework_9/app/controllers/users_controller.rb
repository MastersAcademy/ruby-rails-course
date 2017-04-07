class UsersController < ApplicationController
  def index
    @user = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user}
    end
  end

  def show
    @user = User.all
    @post = Post.all
    respond_to do |format|
      format.html
      format.json { render :json => @post}
    end
  end
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      redirect_to signup_path
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to login_path
  end
  
end

private
  def user_params
    params.require(:user).permit(:name, :password)
  end
