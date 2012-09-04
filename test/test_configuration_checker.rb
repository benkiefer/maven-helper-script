$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'configuration_checker'
require 'test/unit'

class ConfigurationCheckerTest < Test::Unit::TestCase
  def setup
    @checker = MavenHelperScript::ConfigurationChecker.new(File.join(File.dirname(__FILE__)))
  end

  def test_check_for_modules
    assert_equal("parent", @checker.checkForModule("p"))
    assert_equal("parent", @checker.checkForModule("par"))
    assert_equal("boo", @checker.checkForModule("boo"))
  end

  def test_check_for_commands
    assert_equal("clean install", @checker.checkForCommand("ci"))
    assert_equal("jetty:run", @checker.checkForCommand("jr"))
    assert_raise RuntimeError do
      @checker.checkForCommand("j")
    end
  end

end


