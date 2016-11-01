require 'rails/generators/erb/controller/controller_generator'

module Admin
  class ControllerGenerator < Rails::Generators::NamedBase
    def invoke_default
      original_root = Erb::Generators::ControllerGenerator.source_root
      Erb::Generators::ControllerGenerator.source_root File.expand_path('../../templates/erb/controller', __FILE__)
      invoke 'controller', ARGV
      Erb::Generators::ControllerGenerator.source_root original_root
    end
  end
end
