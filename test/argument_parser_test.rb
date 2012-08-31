require_relative "../src/argument_parser"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_parse_multi_arguments
    args = Array['ci', 'p']
    result = ArgumentParser.new().parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
  end

  def test_parse_multi_arguments
    args = Array['ci', 'parent']
    result = ArgumentParser.new().parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
  end

  def test_parse_multi_arguments_specialty_commands
    args = Array['ci', 'p', '-o']
    result = ArgumentParser.new().parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent -o', result[0])
  end

  def test_parse_multi_arguments_multiple_command_strings
    args = Array['ci', 'p', 'ci', 'p']
    result = ArgumentParser.new().parse(args)
    assert_equal(2, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
    assert_equal('mvn clean install -pl parent', result[1])
  end

  def test_parse_multi_arguments_multiple_command_strings_multiple_special_commands
    args = Array['ci', 'p', '-o', 'ci', 'p', '-blah']
    result = ArgumentParser.new().parse(args)
    assert_equal(2, result.length)
    assert_equal('mvn clean install -pl parent -o -blah', result[0])
    assert_equal('mvn clean install -pl parent -o -blah', result[1])
  end

end

