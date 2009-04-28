require File.dirname(__FILE__) + '/../../test_helper'
require 'protx_test'

class SagePayTest < Test::Unit::TestCase
  def setup
    @gateway = SagePayGateway.new(
      :login => 'X'
    )

    @credit_card = credit_card('4242424242424242', :type => 'visa')
    @options = { 
      :billing_address => { 
        :name => 'Tekin Suleyman',
        :address1 => 'Flat 10 Lapwing Court',
        :address2 => 'West Didsbury',
        :city => "Manchester",
        :county => 'Greater Manchester',
        :country => 'GB',
        :zip => 'M20 2PS'
      },
      :order_id => '1',
      :description => 'Store purchase',
      :ip => '86.150.65.37',
      :email => 'tekin@tekin.co.uk',
      :phone => '0161 123 4567'
    }
    @amount = 100
  end
  
  def test_purchase_url
    assert_equal 'https://test.sagepay.com/gateway/service/vspdirect-register.vsp', @gateway.send(:url_for, :purchase)
  end
  
  def test_capture_url
    assert_equal 'https://test.sagepay.com/gateway/service/release.vsp', @gateway.send(:url_for, :capture)
  end
end
