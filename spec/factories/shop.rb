# encoding: UTF-8
FactoryGirl.define do
  factory :shop do
    shop_id 1
    name 'Test Store'
    fwm_domain 'test-store.myponty.com'
    access_token SecureRandom.hex
  end
end
