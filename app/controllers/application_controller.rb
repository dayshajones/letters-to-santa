class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

  def current_user
    if session[:user_id]
      user = User.find(session[:user_id])
    end
  end
  
  def logged_in?
    !!current_user
  end  

  def redirect_if_not_logged_in
      redirect_to  '/login' if !logged_in?
  end

end
