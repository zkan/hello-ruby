require "minitest/autorun"

class ExampleTest < Minitest::Test
  parallelize_me!

  def test_example_one
    puts Process.pid
    puts Thread.current.object_id
    assert_equal 2, 1 + 1
  end

  def test_example_two
    puts Process.pid
    puts Thread.current.object_id
    assert_equal 4, 2 + 2
  end
end
