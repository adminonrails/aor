module Aor
  module Authentication
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :logged_in?
    end

    protected
    def logged_in?
      current_user != :false
    end

    def current_user
      @current_user ||= (login_from_session || login_from_api_key || :false)
    end

    def current_user=(new_user)
      @current_user = new_user
    end

    def current_user_form_session=(new_user)
      session[:user_id] = new_user.try(:id)
      self.current_user = new_user
    end


    def login_required
      logged_in? || access_denied
    end

    def access_denied
      head :forbidden
    end

    def login_from_session
      if session[:user_id]
        new_user = User.find_by_id(session[:user_id])
        session[:user_id] = new_user.try(:id)
        self.current_user = new_user
      end
    end

    def login_from_api_key
      key = api_key
      self.current_user = User.find_by_api_key(key) if key
    end

    def api_key
      request.headers["X-Api-Key"] || params[:api_key]
    end
  end
end
