class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    i = @event.invitations.build(invitation_params)
  
    # i.attended_event_id = params[:event_id]
    # i.attendee_id = session[:user_id]
    i.save
    redirect_to(events_show_path(params[:event_id]))
  end

  private

  def invitation_params
    params = ActionController::Parameters.new(invitation: { attendee_id: session[:user_id] })
    params.require(:invitation).permit(:attendee_id)
  end
end
