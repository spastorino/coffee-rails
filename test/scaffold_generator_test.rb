require 'test_helper'
require 'rails/generators/rails/scaffold/scaffold_generator'
require 'rails/generators/coffee/assets/assets_generator'

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::ScaffoldGenerator

  destination File.expand_path("../tmp", __FILE__)
  setup do
    prepare_destination
    copy_routes
  end

  def test_assets
    run_generator %w(posts --javascript-engine=coffee --orm=false)
    assert_no_file "app/assets/javascripts/posts.js"
    assert_file "app/assets/javascripts/posts.js.coffee"
  end

  private

  def copy_routes
    routes = File.expand_path("../support/routes.rb", __FILE__)
    destination = File.join(destination_root, "config")

    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, destination
  end
end
