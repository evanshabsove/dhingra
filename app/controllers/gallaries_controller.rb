class GallariesController < ApplicationController
  def index
    @gallaries = Gallary.all
  end

  def show
  end
end
