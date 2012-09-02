$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "argument_parser"
require "test/unit"

class ArgumentParserTest < Test::Unit::TestCase
  def setup()
    file = File.join(File.dirname(__FILE__))
    @expectedPom = File.join(file, "pom.xml")
    @parser = MavenHelperScript::ArgumentParser.new(file)
  end

  def test_parse_multi_arguments
    args = Array['ci', 'p']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    expected = 'mvn clean install -pl parent -f ' << @expectedPom
    assert_equal(expected, result[0])
  end

  def test_parse_multi_arguments
    args = Array['ci', 'parent']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    expected = 'mvn clean install -pl parent -f ' << @expectedPom
    assert_equal(expected, result[0])
  end

  def test_parse_multi_arguments_specialty_commands
    args = Array['ci', 'p', '-o']
    result = @parser.parse(args)
    assert_equal(1, result.length)
    expected = 'mvn clean install -pl parent -f ' << @expectedPom << " -o"
    assert_equal(expected, result[0])
  end

  def test_parse_multi_arguments_multiple_command_strings
    args = Array['ci', 'p', 'ci', 'p']
    result = @parser.parse(args)
    assert_equal(2, result.length)
    expected = 'mvn clean install -pl parent -f ' << @expectedPom

    assert_equal(expected, result[0])
    assert_equal(expected, result[1])
  end

  def test_parse_multi_arguments_multiple_command_strings_multiple_special_commands
    args = Array['ci', 'p', '-o', 'ci', 'p', '-blah']
    result = @parser.parse(args)
    assert_equal(2, result.length)
    expected = 'mvn clean install -pl parent -f ' << @expectedPom << " -o -blah"

    assert_equal(expected, result[0])
    assert_equal(expected, result[1])
  end

end

