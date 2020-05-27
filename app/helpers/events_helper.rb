module EventsHelper
  def invalid_username
    flash[:alert]
  end

  def full_event_name(event)
    "#{event.name} at #{event.event_date} in  #{event.location}"
  end

  def attendace(event)
    return 'Attendees List' unless event.invitations.count.zero?

    'No Attendees yet'
  end
end
