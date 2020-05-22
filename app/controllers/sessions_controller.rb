class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      sessions[:user_id] = @user.id
      redirect_to users_show
    else
      redirect_to log_in, alert:'Invalid Username'
    end
  end

  def destroy
  end
end
