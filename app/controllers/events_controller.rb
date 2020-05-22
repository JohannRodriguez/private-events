class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.user_id = session[:user_id]
    @event.name = params[:name]
    if @event.save
      redirect_to users_show_path, notice:'Your event was created'
    else
      redirect_to events_new_path, alert:'Error saving event'
    end
  end

  def show
  end

  def index
  end
end
