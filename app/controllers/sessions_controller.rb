class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to '/sign_in', alert: 'Invalid Username'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
