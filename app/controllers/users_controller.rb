class UsersController < ApplicationController

  def new
  end


  def create
    @user = User.new(name: params[:name],
                    email: params [:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.user_id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
