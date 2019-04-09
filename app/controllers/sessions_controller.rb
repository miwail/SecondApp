class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params.dig(:session, :email))
    if user && user.authenticate(params.dig(:session, :password))
      session[:user_id] = user.id
      flash[:notice] = "Successful log in!"
      redirect_to user_path(user), notice: "Successful log in!"
    else
      flash[:danger]= "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you soon!"
    redirect_to root_url
  end
end
