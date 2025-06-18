class StripProvider
  def charge(user, amount)
  end
end

class User
  attr_accessor :balance, :last_transaction_at

  def initialize(balance: 0)
    @balance = balance
  end
end

class Payment
  def initialize(provider: StripProvider.new)
    @provider = provider
  end

  def charge(user, amount)
    @provider.charge(user, amount)
  end
end

class Subscription
  def self.charge(user, amount)
    provider = StripProvider.new
    provider.charge(user, amount)
    user.balance = (user.balance - amount)
    user.last_transaction_at = Time.now
  end
end
