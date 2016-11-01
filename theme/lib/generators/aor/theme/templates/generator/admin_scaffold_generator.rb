require 'rails/generators/erb/scaffold/scaffold_generator'

module Admin
  class ScaffoldGenerator < Rails::Generators::NamedBase
    def invoke_default
      original_root = Erb::Generators::ScaffoldGenerator.source_root
      Erb::Generators::ScaffoldGenerator.source_root File.expand_path('../../templates/erb/scaffold', __FILE__)
      invoke 'scaffold', ARGV
      Erb::Generators::ScaffoldGenerator.source_root original_root
    end
  end
end
