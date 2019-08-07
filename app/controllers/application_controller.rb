class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    #if devise_controller? and user_signed_in?
    if user_signed_in?
      'application'
    else
      'nonadmin'
    end
  end
end
