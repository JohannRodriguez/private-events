module UsersHelper
  def invalid_event
    flash[:alert]
  end

  def full_event_name(event)
    "#{event.name} at #{event.event_date} in  #{event.location}"
  end

  def upcoming_events(user)
    list = []
    user.invitations.each do |i|
      list.push i if i.attended_event.event_date > Time.now
    end
    list
  end

  def previous_events(user)
    list = []
    user.invitations.each do |i|
      list.push i if i.attended_event.event_date <= Time.now
    end
    list
  end
end
