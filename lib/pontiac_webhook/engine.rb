module PontiacWebhook
  class Engine < Rails::Engine
    isolate_namespace PontiacWebhook
    engine_name 'pontiac_webhook'

    def models_dir
      root.join 'app', 'models'
    end

    initializer "pontiac_webhook.routes" do
      PontiacWebhook::Rails::Routes.install
    end

    initializer "pontiac.acronym" do
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'Fwm'
      end
    end

  end
end
