class EventsController < ApplicationController
  # rubocop:disable Layout/LineLength
  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.created_events.build(event_params)
    if @event.valid?
      if @event.save
        redirect_to users_show_path, notice: 'Your event was created'
      else
        redirect_to events_new_path, alert: 'Error saving event'
      end
    else
      redirect_to events_new_path, alert: 'All fields must be filled'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @event_upcoming = Event.upcoming
    @event_previous = Event.previous
  end

  def event_params
    params.permit(:created_event).permit(:name, :event_date, :location)
  end
  # rubocop:enable Layout/LineLength
end
