module ApplicationHelper
  def css_slug
    "#{params[:controller]}-#{params[:action]}"
  end
end
