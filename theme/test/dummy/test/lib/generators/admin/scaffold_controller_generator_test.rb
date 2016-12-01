require 'test_helper'
require 'rails/generators/test_case'
require 'generators/admin/scaffold_controller/scaffold_controller_generator'

class Aor::ScaffoldControllerGeneratorTest < Rails::Generators::TestCase
  tests Admin::ScaffoldControllerGenerator
  arguments %w[Admin::Post title:string body:text]
  destination File.expand_path('../tmp', __FILE__)
  setup :prepare_destination

  test 'controller content' do
	run_generator 

	assert_file 'app/controllers/admin/posts_controller.rb' do |content|
	  assert_instance_method :index, content do |m|
		assert_match %r{@q = Post\.ransack}, m
	  end

	  assert_instance_method :show, content do |m|
		assert m.blank?
	  end

	  assert_instance_method :new, content do |m|
		assert_match %r{@post = Post\.new}, m
	  end

	  assert_instance_method :edit, content do |m|
		assert m.blank?
	  end

	  assert_instance_method :create, content do |m|
		assert_match %r{@post = Post\.new\(post_params\)}, m
		assert_match %r{@post\.save}, m
		assert_match %r{redirect_to \[:admin, @post\], notice: 'Post was successfully created\.'}, m
		assert_match %r{render :new}, m
	  end

	  assert_instance_method :update, content do |m|
		assert_match %r{redirect_to \[:admin, @post\], notice: 'Post was successfully updated\.'}, m
		assert_match %r{render :edit}, m
	  end

	  assert_instance_method :destroy, content do |m|
		assert_match %r{@post\.destroy}, m
		assert_match %r{redirect_to admin_posts_url, notice: 'Post was successfully destroyed\.'}, m
	  end

	  assert_match %r{def set_post}, content
	  assert_match %r{def post_params}, content
	  assert_match %r{def search_params}, content
	  assert_match %r{params\.require\(:post\)\.permit\(:title, :body\)}, content
	end
  end
end
