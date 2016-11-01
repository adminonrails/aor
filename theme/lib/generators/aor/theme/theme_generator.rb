class Aor::ThemeGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_admin_layout
    copy_file 'theme/admin.js', 'app/assets/javascripts/admin.js'
    copy_file 'theme/admin.css', 'app/assets/stylesheets/admin.css'

    copy_file 'theme/admin_common_headnav.html.erb', 'app/views/admin/common/_headnav.html.erb'
    copy_file 'theme/admin_common_sidebar.html.erb', 'app/views/admin/common/_sidebar.html.erb'
    copy_file 'theme/admin_layout.html.erb', 'app/views/layouts/admin.html.erb'
  end

  def create_admin_generator
    directory 'generator/erb', 'lib/generators/admin/templates/erb'
    copy_file 'generator/admin_controller_generator.rb', 'lib/generators/admin/controller/controller_generator.rb'
    copy_file 'generator/admin_scaffold_controller_generator.rb', 'lib/generators/admin/scaffold_controller/scaffold_controller_generator.rb'
    copy_file 'generator/admin_scaffold_generator.rb', 'lib/generators/admin/scaffold/scaffold_generator.rb'

    directory 'generator/rails', 'lib/generators/admin/templates/rails'
  end
end
