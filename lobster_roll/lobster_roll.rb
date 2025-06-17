require "minitest/autorun"

class LobsterRoll
  def size
    :big
  end

  def delicious?
    true
  end
end

class LobsterRollTest < Minitest::Test
  def setup
    @roll = LobsterRoll.new
  end

  def test_is_delicious
    assert @roll.delicious?
  end

  def test_size
    assert_equal :big, @roll.size
  end
end
