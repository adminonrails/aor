require 'test_helper'
require 'rails/generators/test_case'
require 'generators/aor/theme/theme_generator'

class Aor::ThemeGeneratorTest < Rails::Generators::TestCase
  tests Aor::ThemeGenerator
  destination File.expand_path('../tmp', __FILE__)
  setup :prepare_destination

  test '#create_admin_layout' do
    run_generator

    assert_file 'app/assets/javascripts/admin.js'
    assert_file 'app/assets/stylesheets/admin.css'

    assert_file 'app/views/admin/common/_headnav.html.erb'
    assert_file 'app/views/admin/common/_sidebar.html.erb'
    assert_file 'app/views/admin/common/_errors.html.erb'
    assert_file 'app/views/admin/common/_flash_messages.html.erb'
    assert_file 'app/views/layouts/admin.html.erb'

    assert_file 'app/controllers/admin/base_controller.rb'
    assert_file 'app/helpers/admin/base_helper.rb'

    assert_file 'config/initializers/admin_assets.rb' do |content|
      assert_match 'Rails.application.config.assets.precompile += %w( admin.js admin.css )', content
    end

    assert_file 'config/initializers/admin_assets.rb' do |content|
      assert_match 'Rails.application.config.assets.precompile += %w( admin.js admin.css )', content
    end

    assert_file 'config/initializers/bootstrap_field_error.rb' do |content|
      assert_match %r{field_error_proc}, content
    end
  end
end
