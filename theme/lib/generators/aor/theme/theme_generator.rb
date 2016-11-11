class Aor::ThemeGenerator < Rails::Generators::Base
  source_paths.insert(0, File.expand_path('../templates', __FILE__))

  def create_admin_layout
    copy_file 'theme/admin.js', 'app/assets/javascripts/admin.js'
    copy_file 'theme/admin.css', 'app/assets/stylesheets/admin.css'

    copy_file 'theme/admin_common_headnav.html.erb', 'app/views/admin/common/_headnav.html.erb'
    copy_file 'theme/admin_common_sidebar.html.erb', 'app/views/admin/common/_sidebar.html.erb'
    copy_file 'theme/admin_common_errors.html.erb', 'app/views/admin/common/_errors.html.erb'
    copy_file 'theme/admin_common_flash_messages.html.erb', 'app/views/admin/common/_flash_messages.html.erb'
    copy_file 'theme/admin_layout.html.erb', 'app/views/layouts/admin.html.erb'

    copy_file 'theme/admin_base_controller.rb', 'app/controllers/admin/base_controller.rb'
    copy_file 'theme/admin_base_helper.rb', 'app/helpers/admin/base_helper.rb'

    initializer 'admin_assets.rb' do
      "Rails.application.config.assets.precompile += %w( admin.js admin.css )"
    end

    initializer 'bootstrap_field_error.rb' do
      'Rails.application.config.action_view.field_error_proc = Proc.new{ |html_tag, instance| "<div class=\"has-error\">#{html_tag}</div>".html_safe }'
    end
  end

  def create_admin_generator
    directory 'generator/erb', 'lib/generators/admin/templates/erb'
    copy_file 'generator/admin_controller_generator.rb.noautoload', 'lib/generators/admin/controller/controller_generator.rb'
    copy_file 'generator/admin_scaffold_controller_generator.rb.noautoload', 'lib/generators/admin/scaffold_controller/scaffold_controller_generator.rb'
    copy_file 'generator/admin_scaffold_generator.rb.noautoload', 'lib/generators/admin/scaffold/scaffold_generator.rb'

    directory 'generator/rails', 'lib/generators/admin/templates/rails'
  end
end
