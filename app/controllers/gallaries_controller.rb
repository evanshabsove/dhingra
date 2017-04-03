class GallariesController < ApplicationController
  def index
    @gallaries = Gallary.all
  end

  def show
    @gallary = Gallary.find(params[:id])
  end
end
