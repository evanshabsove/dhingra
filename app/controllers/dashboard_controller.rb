class DashboardController < ApplicationController
  before_filter :authorize_admin

  def index
    #code
  end

  def create
    
  end

  def edit
    #code
  end


  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
