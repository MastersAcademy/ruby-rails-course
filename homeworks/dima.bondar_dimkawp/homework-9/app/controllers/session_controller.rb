class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:user][:email]
    if user
      if user.email == params[:user][:email]
        session[:user_id] = user.id
        render 'index/index'
      end
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    render 'new'
  end
end
