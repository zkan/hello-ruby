class StripProvider
  def charge(user, amount)
  end
end

class User
end

class Payment
  def initialize(provider: StripProvider.new)
    @provider = provider
  end

  def charge(user, amount)
    @provider.charge(user, amount)
  end
end
