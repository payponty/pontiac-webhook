Rails.application.routes.draw do
  use_pontiac
  use_pontiac_webhook
  root :to => 'home#index'
end
