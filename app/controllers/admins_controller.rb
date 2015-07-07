class AdminsController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(admin: true)
    binding.pry

    flash[:notice] = "So be it!"
    redirect_to :back
  end
end
