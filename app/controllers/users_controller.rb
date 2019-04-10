# frozen_string_literal: true

class UsersController < ApplicationController
  include UserLogin
  before_action :find_user, only: %i[show destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:notice] = 'Your account successful created!'
      flash[:notice] = 'Please, fill in your profile'
      redirect_to edit_profile_path(@user)
    else
      flash.now[:alert] = @user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
