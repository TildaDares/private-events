require 'date'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login_required
    unless logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user

  def all_users
    User.all
  end
  
  helper_method :all_users

  def change_date_format(date)
    date.strftime("%A, %d %b %Y %l:%M %p")
  end

  helper_method :change_date_format
end
