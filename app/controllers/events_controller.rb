class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.created_events.build(event_params(params[:name], params[:event_date], params[:location]))
    if @event.valid?
      if @event.save
        redirect_to user_path(session[:user_id]), notice: 'Your event was created'
      else
        redirect_to new_event_path, alert: 'Error saving event'
      end
    else
      redirect_to new_event_path, alert: 'All fields must be filled'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @event_upcoming = Event.upcoming
    @event_previous = Event.previous
  end

  def event_params(name, event_date, location)
    params = ActionController::Parameters.new(event: { name: name, event_date: event_date, location: location })
    params.require(:event).permit(:name, :event_date, :location)
  end
end
