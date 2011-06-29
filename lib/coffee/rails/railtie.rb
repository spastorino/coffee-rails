module Coffee::Rails
  class Railtie < ::Rails::Railtie
    config.app_generators.javascript_engine :coffee
  end
end
