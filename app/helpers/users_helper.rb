module UsersHelper
  def invalid_event
    if flash[:alert]
      flash[:alert]
    end
  end
end
