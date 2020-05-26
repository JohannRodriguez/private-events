module EventsHelper
  def invalid_username
    if flash[:alert]
      flash[:alert]
    end
  end

  def full_event_name(event)
    "#{event.name} at #{event.event_date} in  #{event.location}"
  end

  def attendace(event)
    return "Attendees List" unless event.invitations.count==0
    "No Attendees yet"
  end
end
