$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'configuration_checker'
require 'test/unit'

class ConfigurationCheckerTest < Test::Unit::TestCase
  def setup
    file = File.open(File.join(File.dirname(__FILE__), 'm.yml'))
    @checker = MavenHelperScript::ConfigurationChecker.new(file)
  end

  def test_check_for_modules
    assert_equal("parent", @checker.checkForModule("p"))
    assert_equal("parent", @checker.checkForModule("par"))
    assert_nil(@checker.checkForModule("boo"))
  end

  def test_check_for_commands
    assert_equal("clean install", @checker.checkForCommand("ci"))
    assert_raise RuntimeError do
      @checker.checkForCommand("boo")
    end
  end

end


