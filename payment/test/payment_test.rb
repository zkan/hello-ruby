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

class SubscriptionTest < Minitest::Test
  def setup
    @mock_provider = Minitest::Mock.new
    @mock_provider.expect(:charge, true, [Object, Numeric])
  end

  def test_charge_adjusts_balance
    StripProvider.stub :new, @mock_provider do
      Time.stub(:now, Time.new(2024, 1, 1)) do
        user = User.new(balance: 300)
        assert Subscription.charge(user, 100)
        assert_equal 200, user.balance
        assert_equal Time.new(2024, 1, 1).to_i, user.last_transaction_at.to_i
      end
    end
    assert_mock @mock_provider
  end
end
