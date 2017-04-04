class GallariesController < ApplicationController
  def index
    @gallaries = Gallary.all
  end

  def show
    @gallary = Gallary.find(params[:id])
  end

  def new
    @gallary = Gallary.new
  end

  def edit
    @gallary = Gallary.find(params[:id])
  end

  def create
    @gallary = Gallary.new(gallery_params)

    if @gallary.save
      redirect_to gallaries_url
    else
      render :new
    end
  end

  def update
    @gallary = Gallary.find(params[:id])
    if @gallary.update_attributes(gallary_params)
      redirect_to gallaries_url
    else
      render :edit
    end
  end

  def destroy
    @gallary = Gallary.find(params[:id])
    if @gallary.destroy
      redirect_to gallaries_url
    end
  end

  private
  def gallary_params
    params.require(:gallary).permit(:title, :description)
  end
end
