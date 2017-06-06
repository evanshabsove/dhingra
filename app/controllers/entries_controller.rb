class EntriesController < ApplicationController

  def new
  end

  def create
  end

  def update
  end

  private

  def update_params
    params.require(:entry).permit(:description)
  end
end
