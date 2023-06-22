class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_image)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_image)
  end
end
