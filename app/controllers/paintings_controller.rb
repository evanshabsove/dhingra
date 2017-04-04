class PaintingsController < ApplicationController
  before_action :load_gallery

  def show
    @painting = Painting.find(params[:id])
  end

  def new
    @painting = Painting.new
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      redirect_to galleries_url
    else
      render :new
    end
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(painting_params)
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

  #Private params
  private
  def painting_params
    params.require(:painting).permit(:title, :description, :image)
  end

  def load_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

end
