class GallariesController < ApplicationController
  def index
    @gallaries = Gallary.all
  end

  def show
    @gallary = Gallary.find(params[:id])
  end

  def new
    @gallery = Gallary.new
  end

  def edit
    @gallery = Gallary.find(params[:id])
  end

  def create
    @gallery = Gallary.new(gallery_params)

    if @gallery.save
      redirect_to gallaries_url
    else
      render :new
    end
  end

  def update
    @gallery = Gallary.find(params[:id])
    if @gallery.update_attributes(gallery_params)
      redirect_to gallaries_url
    else
      render :edit
    end
  end

  def destroy
    @gallery = Gallary.find(params[:id])
    if @gallery.destroy
      redirect_to gallaries_url
    end
  end

  private
  def gallery_params
    params.require(:gallary).permit(:title, :description)
  end
end
