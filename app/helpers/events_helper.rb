# rubocop:disable Style/HashSyntax
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
    if @event.event_date < Time.now
      'You can not join a past event'
    elsif @event.creator_id == session[:user_id]
      'Tell people  to join your event!'
    elsif joined?
      'You have already joined this event'
    elsif session[:user_id].nil?
      render html: '<p>You must be signed in to join this event <a href="/sign_in">sign in</a></p>'.html_safe
    else
      link_to 'Join event', invitation_path(:event_id => @event.id)
    end
  end

  private

  def joined?
    @event.invitations.each do |i|
      return true if i.attendee_id == session[:user_id]
    end
    false
  end
end

# rubocop:enable Style/HashSyntax
