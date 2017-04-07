class SessionsController < ApplicationController
  def new
    if !current_user.nil?
      redirect_to user_path(current_user.id)
    end
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user_path(current_user.id)
    else
      # Create an error message.
      flash[:danger] = 'Invalid name/password combination' # Not quite right!
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
