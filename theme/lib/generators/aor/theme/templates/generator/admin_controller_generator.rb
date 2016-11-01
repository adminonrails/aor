require 'rails/generators/erb/controller/controller_generator'
require 'rails/generators/rails/controller/controller_generator'

module Admin
  class ControllerGenerator < Rails::Generators::NamedBase
    def invoke_default
      Erb::Generators::ControllerGenerator.source_root File.expand_path('../../templates/erb/controller', __FILE__)
      Rails::Generators::ControllerGenerator.source_root File.expand_path('../../templates/rails/controller', __FILE__)
      invoke 'controller', ARGV
    end
  end
end
