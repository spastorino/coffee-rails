require "rails/generators/named_base"

module Coffee
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def copy_coffee
        template "javascript.coffee", File.join('app/javascript', class_path, "#{file_name}.coffee")
      end
    end
  end
end
