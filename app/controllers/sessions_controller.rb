class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:username], params[:password])

    if @user
      session[:user_name] = @user.username
      flash[:notice] = "You have been logged in."
      redirect_to questions_path
    else
      flash[:alert] = "You have not been logged in. Please try again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_name] = nil
    redirect_to "/"
  end

end
