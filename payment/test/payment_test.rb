require "minitest/autorun"
require_relative "../payment"

class PaymentTest < Minitest::Test
  def setup
    @mock_provider = Minitest::Mock.new
    @mock_provider.expect(:charge, true, [Object, Numeric])
  end

  def test_user_is_charged
    payment = Payment.new(provider: @mock_provider)
    assert payment.charge(User.new, 100)
    assert_mock @mock_provider
  end
end
