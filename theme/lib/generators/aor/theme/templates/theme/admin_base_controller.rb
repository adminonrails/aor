class Admin::BaseController < ApplicationController
  include Aor::Authentication
  include Aor::Authorization

  #before_action :login_required
  #before_action :authorize_admin

  layout 'admin'

  protected
  def current_user
    @current_user ||= (login_from_session || :false)
  end

  def login_from_session
    if session[:user_id]
      new_user = AdmUser.find_by(id: session[:user_id])
      self.current_user_form_session = new_user
    end
  end

  def current_ability
    @current_ability ||= AdmAbility.new(current_user)
  end
end
