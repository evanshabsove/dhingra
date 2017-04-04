class GalleriesController < ApplicationController

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
      redirect_to galleries_url
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
end
