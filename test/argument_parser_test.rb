require_relative "../src/argument_parser"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_parse
    assert_equal('clean install', ArgumentParser.new().parse(Array['ci']))
    assert_equal('jetty:run', ArgumentParser.new().parse(Array['jr']))
    assert_equal('clean', ArgumentParser.new().parse(Array['c']))
    assert_equal('install', ArgumentParser.new().parse(Array['i']))
    assert_equal('clean test-compile', ArgumentParser.new().parse(Array['ct']))
  end

  def test_parse_multi_arguments
    args = Array['ci', 'module']
    result = ArgumentParser.new().parse(args)
    assert_equal('clean install -pl module', result)
  end

  def test_parse_multi_arguments_multiple_command_strings
    args = Array['ci', 'module', 'ci', 'otherModule']
    result = ArgumentParser.new().parse(args)
    assert_equal('clean install -pl module && clean install -pl otherModule', result)
  end



end

