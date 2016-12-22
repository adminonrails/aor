require 'rails/generators/erb/scaffold/scaffold_generator'
require 'rails/generators/test_unit/scaffold/scaffold_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Admin
  class ScaffoldControllerGenerator < Rails::Generators::NamedBase
    def invoke_default
      Erb::Generators::ScaffoldGenerator.source_paths.insert(0, File.expand_path('../../templates/erb/scaffold', __FILE__))
      TestUnit::Generators::ScaffoldGenerator.source_paths.insert(0, File.expand_path('../../templates/rails/scaffold_controller', __FILE__))
      Rails::Generators::ScaffoldControllerGenerator.source_paths.insert(0, File.expand_path('../../templates/rails/scaffold_controller', __FILE__))
      Rails::Generators::ScaffoldControllerGenerator.remove_hook_for(:jbuilder) if defined?(Jbuilder)
      invoke 'scaffold_controller'
    end
  end
end
