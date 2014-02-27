require 'spec_helper'

describe Shop do

  let(:shop) { FactoryGirl.create(:shop) }

  context '#create' do

    it 'should create webhook via api' do
      stub = stub_request(:post, "test-store.myponty.com/api/webhooks.json")
      shop
      stub.should have_been_requested
    end

  end

end
