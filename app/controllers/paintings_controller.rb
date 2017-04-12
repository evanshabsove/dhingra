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
    @painting = @gallery.paintings.create(painting_params)

    if @painting.save
      @paintings = Painting.all

      respond_to do |format|
        format.html
        format.js
        format.json { render json: {:success => true, html: (render_to_string('_all_paintings.html.erb', objects: [@gallery, @paintings], layout: false))} }
      end
    else
      render :new
    end
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(painting_params)
      redirect_to dashboard_painting_url(@gallery)
    else
      render :edit
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    if @painting.destroy
      redirect_to dashboard_painting_url(@gallery)
    end
  end

  #Private params
  private

  def load_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def painting_params
    params.require(:painting).permit(:title, :description, :image)
  end

end
