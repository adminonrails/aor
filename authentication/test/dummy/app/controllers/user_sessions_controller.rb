class UserSessionsController < ApplicationController
  before_action :login_required, only: [:logout]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      self.current_user_form_session = user
      render(json: current_user)
      return
    end
    head :forbidden
  end

  def logout
    self.current_user_form_session = nil
    head :ok
  end
end
