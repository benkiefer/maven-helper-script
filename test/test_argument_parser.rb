$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "argument_parser"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
  def setup()
    file = File.open(File.join(File.dirname(__FILE__), 'm.yml'))
    @parser = MavenHelperScript::ArgumentParser.new(file)
  end

  def test_parse_multi_arguments
    args = Array['ci', 'p']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
  end

  def test_parse_multi_arguments
    args = Array['ci', 'parent']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
  end

  def test_parse_multi_arguments_specialty_commands
    args = Array['ci', 'p', '-o']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    assert_equal('mvn clean install -pl parent -o', result[0])
  end

  def test_parse_multi_arguments_multiple_command_strings
    args = Array['ci', 'p', 'ci', 'p']
    result = @parser.parse(args)
    assert_equal(2, result.length)
    assert_equal('mvn clean install -pl parent', result[0])
    assert_equal('mvn clean install -pl parent', result[1])
  end

  def test_parse_multi_arguments_multiple_command_strings_multiple_special_commands
    args = Array['ci', 'p', '-o', 'ci', 'p', '-blah']
    result = @parser.parse(args)
    assert_equal(2, result.length)
    assert_equal('mvn clean install -pl parent -o -blah', result[0])
    assert_equal('mvn clean install -pl parent -o -blah', result[1])
  end

end

