require "#{PontiacWebhook::Engine.models_dir}/shop"
require "#{Pontiac::Engine.models_dir}/shop"
class Shop
  has_many :orders
  attr_accessible :shop_id, :name, :fwm_domain
end
