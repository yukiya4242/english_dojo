class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :edit, :update, :destroy]
  before_action :check_user_status,  only:[:show]

  def index
    @all_users = User.all
    @users = User.where(is_deleted: false) #退会済みではないユーザーのみ一覧に表示
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true) #trueは退会してるかのことtrue=退会ずみ, false=退会済みでない
    reset.session
    flash[:notice] = "またのご利用心よりお待ちしております。"
    redirect_to root_url
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
      flash[:notice] = "編集に成功しました。再度ログインしてください"
      redirect_to (@user)
    else
      p @user.errors
      render 'edit'
    end
  end

  private

  def check_user_status
    user = User.find(params[:id])
    if user.is_deleted
      flash[:noitce] = "ユーザーは退会済みです"
      redirect_to root_url
    end
  end

  def update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


   def user_params
    params.require(:user).permit(:email, :username, :profile_image, :password, :password_confirmation)
   end
end
