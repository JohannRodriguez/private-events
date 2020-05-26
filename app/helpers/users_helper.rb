module UsersHelper
  def invalid_event
    if flash[:alert]
      flash[:alert]
    end
  end

  def full_event_name(event)
    "#{event.name} at #{event.event_date} in  #{event.location}"
  end

  def attended_event(item)
    @event = item.attended_event.name
  end
end
