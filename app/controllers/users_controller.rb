class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to sign_in_url
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
