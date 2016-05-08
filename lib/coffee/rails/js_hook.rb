module Coffee
  module Rails
    module JsHook
      extend ActiveSupport::Concern

      included do
        no_tasks do
          def js_template(source, destination)
            template(source + '.coffee', destination + '.coffee')
          end
        end
      end
    end
  end
end
