class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if @current_user.nil?
      if session[:user_id].present?
        @current_user = User.find(session[:user_id])
      end
    else
      @current_user
    end
  end

  def authenticate_user!
    unless current_user
      flash[:alert] = "You must be logged in to do that!"
    end
  end
end
