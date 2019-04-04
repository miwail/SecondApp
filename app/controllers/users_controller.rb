class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:notice] = "Your account successful created!"
      flash[:notice] = "Please, fill in your profile"
      redirect_to edit_profile_path(@user)
    else
      flash.now[:warning] = "Oops, thy again"
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
