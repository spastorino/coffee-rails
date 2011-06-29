module Coffee::Rails
  class Railtie < ::Rails::Railtie
    initializer :setup_coffee do
      config.app_generators.javascript_engine 'coffee'
    end
  end
end
