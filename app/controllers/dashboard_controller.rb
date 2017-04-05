class DashboardController < ApplicationController
  before_filter :authorize_admin

  def index
    #code
  end

  def create
    @gallery = Gallery.new
  end

  def edit
    @gallerys = Gallery.all
  end

  def paintings
    @gallery = Gallery.find(params[:id])
    @paintings = @gallery.paintings
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
