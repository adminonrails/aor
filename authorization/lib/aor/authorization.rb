require 'cancancan'

module Aor
  module Authorization
    extend ActiveSupport::Concern

    included do
      include CanCan::ControllerAdditions

      rescue_from CanCan::AccessDenied do |exception|
        access_denied
      end
    end

    protected
    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    def model_class
      controller_name.to_sym.singularize
    end

    def authorize_admin
      authorize! action_name.to_sym, model_class
    end

    def access_denied
      head :forbidden
    end
  end
end
