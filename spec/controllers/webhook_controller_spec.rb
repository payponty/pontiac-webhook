# encoding: utf-8
require 'spec_helper'

describe WebhookController do

  let(:shop) { FactoryGirl.create(:shop) }

  let(:created_at) { Time.parse('2013-07-17 12:12:12') }

  let(:order) do
    {
      id: 1,
      name: 'Order #1',
      financial_status: :paided,
      financial_status_name: 'Paided',
      fulfillment_status: :unshipped,
      fulfillment_status_name: 'Unshipped',
      total_price: 45,
      created_at: created_at
    }
  end

  before do
    stub_request(:post, "http://test-store.myponty.com/api/webhooks.json")
  end

  context 'with signature' do

    context 'orders_fulfilled' do

      it 'should be success', f: true do
        expect do
          data = {order: order}.to_json
          digest  = OpenSSL::Digest::Digest.new('sha256')
          sign = Base64.encode64(OpenSSL::HMAC.digest(digest, SecretSetting.oauth.secret, data)).strip
          request.env['HTTP_X_FWM_HMAC_SHA256'] = sign
          request.env['HTTP_X_FWM_DOMAIN'] = shop.fwm_domain
          request.env['RAW_POST_DATA'] = data
          post :orders_fulfilled
          response.should be_success
          Order.last.created_at.should eql created_at
        end.should change(Order, :count).by(1)
      end

    end

  end

  context 'without signature' do

    context 'orders_fulfilled' do

      it 'should be faild' do
        expect do
          request.env['x_FWM_DOMAIN'] = shop.fwm_domain
          post :orders_fulfilled, order: order
          JSON(response.body)['errors'].should eql 'Signature invalid'
        end.should_not change(Order, :count)
      end

    end

  end

end
