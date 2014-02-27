$:.push File.expand_path("../lib", __FILE__)

require "pontiac_webhook/version"

Gem::Specification.new do |s|
  s.name        = "pontiac-webhook"
  s.version     = PontiacWebhook::VERSION
  s.authors     = ["PayPonty"]
  s.email       = ["payponty.info@gmail.com"]
  s.homepage    = "http://payponty.github.io/pontiac-webhook"
  s.summary     = "Pontiac Webhook Engine"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "pontiac", "~> 0.1.4"
  s.add_dependency "delayed_job_active_record", "~> 0.3.2"
  s.add_dependency "daemons", "~> 1.1.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.10.1"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "webmock"
end
