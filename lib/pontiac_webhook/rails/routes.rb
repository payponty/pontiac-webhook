module PontiacWebhook
  module Rails
    class Routes
      module Helper
        def use_pontiac_webhook(options = {}, &block)
          self.post '/webhook', to: 'webhook#orders_fulfilled'
        end
      end

      def self.install
        ActionDispatch::Routing::Mapper.send :include, PontiacWebhook::Rails::Routes::Helper
      end
    end
  end
end
