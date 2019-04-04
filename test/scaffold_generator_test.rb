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
    if Rails::VERSION::MAJOR < 6
      run_generator %w(posts --javascripts --javascript-engine=coffee --orm=false)
      assert_no_file "app/assets/javascripts/posts.js"
      assert_file "app/assets/javascripts/posts.coffee"
    else
      run_generator %w(posts --javascript-engine=coffee --orm=false)
      assert_no_file "app/javascript/posts.js"
      assert_file "app/javascript/posts.coffee"
    end
  end
end
