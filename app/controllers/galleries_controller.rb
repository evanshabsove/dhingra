class GalleriesController < ApplicationController

  before_filter :authorize_admin, :only => [:create, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      if current_user.admin == true
        redirect_to dashboard_index_url
      # this is kind of strange b/c to access this controller you have to be admin. might change.
      else
        redirect_to galleries_url
      end
    else
      render :new
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(gallery_params)
      redirect_to galleries_url
    else
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.destroy
      redirect_to galleries_url
    end
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
