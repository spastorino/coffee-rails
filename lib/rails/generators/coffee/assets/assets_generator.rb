require "rails/generators/named_base"

module Coffee
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def copy_coffee
        if Rails::VERSION::MAJOR < 6
          template "javascript.coffee", File.join('app/assets/javascripts', class_path, "#{file_name}.coffee")
        else
          template "javascript.coffee", File.join('app/javascript', class_path, "#{file_name}.coffee")
        end
      end
    end
  end
end
