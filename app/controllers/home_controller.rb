class HomeController < ApplicationController
  def home
  end

  def about
    @featured_galleries = Gallery.first(3)
  end

  def contact
    #code
  end

  def blog
    #code
  end

  def index
    @featured_galleries = Gallery.first(3)
  end
end
