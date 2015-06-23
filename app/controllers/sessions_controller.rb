class SessionsController < ApplicationController
   skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render { message: "lactose beware!" }
    else
      render { message: "You entereed the wrong information, please try again" }
    end
  end

  def destroy
    session[:user_id] = nil
    render "logged out"
  end
end
