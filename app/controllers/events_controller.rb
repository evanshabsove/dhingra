class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to events_path
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
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to events_path
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to events_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :image, :date)
  end

end
