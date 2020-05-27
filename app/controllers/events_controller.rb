class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.events.build
    @event.name = params[:name]
    @event.event_date = params[:event_date]
    @event.location = params[:location]
    if @event.save
      redirect_to users_show_path, notice: 'Your event was created'
    else
      redirect_to events_new_path, alert: 'Error saving event'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @event_upcoming = Event.upcoming
    @event_previous = Event.previous
  end
end
