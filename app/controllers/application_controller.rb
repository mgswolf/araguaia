class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    redirect_user_to(resource)
  end

  def redirect_user_to(resource)
    if resource.admin
      admin_root_path
    else
      report_path(resource)
    end
  end
end
