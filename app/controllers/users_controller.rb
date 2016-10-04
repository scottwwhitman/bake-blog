class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      # session[:user_id] = user.id
      login user
      redirect_to root_path
    else
      redirect_to new_user_path
    end

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
