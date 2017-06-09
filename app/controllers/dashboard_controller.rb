class DashboardController < ApplicationController
  before_filter :authorize_admin
  before_filter :check_entries

  def index
    #code
  end

  def create
    @gallery = Gallery.new
  end

  def edit
    @gallerys = Gallery.all
  end

  def paintings
    @gallery = Gallery.find(params[:id])
    @paintings = @gallery.paintings
    @painting = Painting.new
  end

  def information

    @contact = Entry.where(category: "contact").first
    @about = Entry.where(category: "about").first
    @homepage = Entry.where(category: "homepage").first


  end

  private

  def check_entries
    if Entry.where(category: "contact").length == 0
      Entry.create!(category: "contact")
    end
    if Entry.where(category: "about").length == 0
      Entry.create!(category: "about")
    end
    if Entry.where(category: "homepage").length == 0
      Entry.create!(category: "homepage")
    end
  end

  def authorize_admin
    if current_user
      return unless !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    else
      redirect_to root_url, alert: "Must log in"
    end
  end

end
