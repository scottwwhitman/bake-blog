module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    # return the current user based on session user id
  end

  def logged_in?
    # check if someone is logged in
  end

  def logout
    session[:user_id] = nil
  end
end
