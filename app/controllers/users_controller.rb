class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
