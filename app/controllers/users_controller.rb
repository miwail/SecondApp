class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account successful created!"
      flash[:notice] = "Please, fill in your profile"
      redirect_to edit_profile_path(@user)
    else
      flash.now[:warning] = "Oops, thy again"
      render "new"
    end
  end

  def destroy
    @user.destroy
  end


  def find_user
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
