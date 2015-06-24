class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      notice: "lactose beware!"
    else
      notice: "You entereed the wrong information, please try again"
    end
  end

  def destroy
    session[:user_id] = nil
    notice: "logged out"
  end
end
