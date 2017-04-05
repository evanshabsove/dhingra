class SessionsController < ApplicationController

  def admin
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.admin == true
        redirect_to dashboard_index_path
      else
        redirect_to root_path, notice: "Logged In!"
      end
    else
      flash.now[:alert] = "Invalid User Name or Password"
      render "admin"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end

end
