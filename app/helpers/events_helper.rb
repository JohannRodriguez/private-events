module EventsHelper
  def invalid_username
    if flash[:alert]
      flash[:alert]
    end
  end
end
