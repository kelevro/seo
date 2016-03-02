class Seo::ApplicationController < ActionController::Base
  layout 'seo/application'
  before_action Seo.auth_method_name if Seo.auth_method_name

  before_action :authenticate_admin_manager!

  check_authorization

  def initialize
    super
    I18n.locale = :en
  end

  def current_ability
    @current_ability ||= current_admin_manager.ability
  end

  def authenticate_admin_manager!
    if admin_manager_signed_in?
      super
    else
      redirect_to main_app.admin_login_path
    end
  end
end
