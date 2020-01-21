class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_index_path
    else
      redirect_to dashboard_index_path
      flash[:notice] = "Form is invalid"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
