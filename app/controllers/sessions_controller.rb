class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  # log user in using session
  def create
    # does user exist (by email)?
    user = User.find_by_email(user_params[:email])
    if user.nil?
      redirect_to login_path
    else  # user exists
      # is this the correct password for that user
      if user.authenticate(user_params[:password])  # pw correct
        # log them in
        # session[:user_id] = user.id
        login user
        redirect_to root_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    # log the person out
    # session[:user_id] = nil
    logout
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
