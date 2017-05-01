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
    @painting = Painting.new
  end

  private

  def authorize_admin
    if current_user
      return unless !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    else
      redirect_to root_url, alert: "Must log in"
    end
  end

end
