require_relative "../src/argument_parser"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_parse_multi_arguments
    args = Array['ci', 'module']
    result = ArgumentParser.new().parse(args)
    assert_equal(1, result.length)
    assert_equal('clean install -pl module', result[0])
  end

  def test_parse_multi_arguments_specialty_commands
    args = Array['ci', 'module', '-o']
    result = ArgumentParser.new().parse(args)
    assert_equal(1, result.length)
    assert_equal('clean install -pl module -o', result[0])
  end

  def test_parse_multi_arguments_multiple_command_strings
    args = Array['ci', 'module', 'ci', 'otherModule']
    result = ArgumentParser.new().parse(args)
    assert_equal(2, result.length)
    assert_equal('clean install -pl module', result[0])
    assert_equal('clean install -pl otherModule', result[1])
  end

  def test_parse_multi_arguments_multiple_command_strings_multiple_special_commands
    args = Array['ci', 'module', '-o', 'ci', 'otherModule', '-blah']
    result = ArgumentParser.new().parse(args)
    assert_equal(2, result.length)
    assert_equal('clean install -pl module -o -blah', result[0])
    assert_equal('clean install -pl otherModule -o -blah', result[1])
  end

end

