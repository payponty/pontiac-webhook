require "pontiac_webhook/engine"
require "delayed_job_active_record"

module PontiacWebhook

  module Rails
    autoload :Routes, "pontiac_webhook/rails/routes"
  end

end
