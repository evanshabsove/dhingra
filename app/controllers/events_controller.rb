class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.new(event_params)

    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    end
  end

  def destroy
    #code
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :image, :date)
  end

end
