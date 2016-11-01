class Admin::BaseController < ApplicationController
  include Aor::Authorization

  before_action :authorize_admin

  protected
  def current_ability
    AdminAbility.new(current_user)
  end

  def current_user
    params[:user].try(:to_sym)
  end
end
