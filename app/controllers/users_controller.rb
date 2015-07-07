class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Log user in
      session[:user_name] = @user.username
      flash[:notice] = "Welcome to the site!"

      # Send welcome email
      @user.send_welcome_email
      #UserMailer.welcome_email(@user).deliver
      redirect_to questions_path
    else
      flash[:notice] = "There was a problem creating your account."
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
