module PontiacWebhook
  class WebhookController < ApplicationController
    skip_before_filter :verify_authenticity_token
    skip_before_filter :authenticate_shop!
    before_filter :check_source
    before_filter :check_shop

    def orders_fulfilled
      render nothing: true
    end

    protected
    def check_source
      payponty_sign = request.headers['HTTP_X_FWM_HMAC_SHA256']
      data = request.body.read
      request.body.rewind
      digest  = OpenSSL::Digest::Digest.new('sha256')
      sign = Base64.encode64(OpenSSL::HMAC.digest(digest, SecretSetting.oauth.secret, data)).strip
      render json: { errors: 'Signature invalid' } and return unless sign == payponty_sign
    end

    def check_shop
      render json: { errors: 'Domain invalid' } and return unless shop
    end

    def shop
      domain = request.headers['HTTP_X_FWM_DOMAIN']
      @shop ||= Shop.find_by_fwm_domain(domain) unless domain.blank?
    end

    def order_id
      request.headers['HTTP_X_FWM_ORDER_ID']
    end

  end
end
