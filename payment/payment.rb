class StripeProvider
  def charge(user, amount)
  end
end

class User
  attr_accessor :balance, :last_transaction_at

  def initialize(balance: 0)
    @balance = balance
  end
end

class OrderProcessor
  def initialize(user, amount)
    @user = user
    @amount = amount
    @stripe_provider = StripeProvider.new
  end

  def process_order
    if @stripe_provider.charge(@user, @amount)
      "Payment successful"
    else
      "Payment failed"
    end
  end
end

class Payment
  def initialize(provider: StripeProvider.new)
    @provider = provider
  end

  def charge(user, amount)
    @provider.charge(user, amount)
  end
end

class Subscription
  def self.charge(user, amount)
    provider = StripeProvider.new
    provider.charge(user, amount)
    user.balance = (user.balance - amount)
    user.last_transaction_at = Time.now
  end
end
