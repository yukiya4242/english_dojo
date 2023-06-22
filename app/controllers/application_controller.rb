class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      user_psth(current_user)
    end
  end


  def after_sign_out_path_for(resource)
    root_url
  end
end
