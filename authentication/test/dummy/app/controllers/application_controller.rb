class ApplicationController < ActionController::Base
  include Aor::Authentication

  protect_from_forgery with: :exception
end
