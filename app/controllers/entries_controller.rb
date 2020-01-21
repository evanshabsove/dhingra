class EntriesController < ApplicationController

  def new
  end

  def create
  end

  def update
    entry = Entry.find_by_id(params[:id])
    entry.update_attributes(update_params)
    if entry.save
      redirect_to dashboard_information_url
    end
  end

  private

  def update_params
    params.require(:entry).permit(:description)
  end
end
