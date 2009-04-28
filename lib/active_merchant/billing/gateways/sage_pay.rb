module ActiveMerchant
  module Billing
    class SagePayGateway < ProtxGateway
      TEST_URL = 'https://test.sagepay.com/gateway/service'
      LIVE_URL = 'https://live.sagepay.com/gateway/service'
      SIMULATOR_URL = 'https://test.sagepay.com/simulator'
      
      self.homepage_url = 'http://www.sagepay.com'
      self.display_name = 'SagePay'
      
      private
      
      def build_url(action)
        endpoint = [ :purchase, :authorization ].include?(action) ? "vspdirect-register" : TRANSACTIONS[action].downcase
        "#{test? ? TEST_URL : LIVE_URL}/#{endpoint}.vsp"
      end
    end
  end
end
