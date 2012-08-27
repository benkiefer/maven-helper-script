require_relative "../src/argument_parser"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_parse
    strings = Array['a', 'b', 'c']
    result = ArgumentParser.new().parse(strings)
    assert_equal('a b c', result)
  end

end

