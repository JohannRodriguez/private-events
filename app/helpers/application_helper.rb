module ApplicationHelper
  def user_first_btn
    if !session[:user_id].nil?
      link_to 'profile', users_show_path
    else
      link_to 'Sign in', sign_in_path 
    end
  end

  def user_second_btn
    if !session[:user_id].nil?
      link_to 'Logout', sessions_destroy_path
    else
      link_to 'Sign up', users_new_path
    end
  end
end
