class HomeController < ApplicationController
  def home
  end

  def about
    @featured_galleries = Gallery.first(3)
    @entry = Entry.where(category: "about").first
  end

  def contact
    #code
    @entry = Entry.where(category: "contact").first

  end

  def blog
    #code
  end

  def events
    @events = Event.all
  end

  def index
    @featured_galleries = Gallery.first(3)
    @entry = Entry.where(category: "homepage").first
  end
end
