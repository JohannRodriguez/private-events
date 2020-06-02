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


  def join_event
    if @event.creator_id == session[:user_id]
      'Tell people  to join your event!'
    elsif joined?
      'You have already joined this event'
    else
      'Join event'
    end
    # link_to 'Join event'
  end

  def joined?
    @event.invitations.each do |i|
      return true if i.attendee_id == session[:user_id]
    end
    false
  end
end
