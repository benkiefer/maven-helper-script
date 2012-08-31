require_relative "../src/configuration_checker"
require "test/unit"

class ConfigurationCheckerTest < Test::Unit::TestCase

  def test_check_for_modules
    assert_equal("parent", ConfigurationChecker.new().checkForModule("p"))
    assert_equal("parent", ConfigurationChecker.new().checkForModule("par"))
    assert_nil(ConfigurationChecker.new().checkForModule("boo"))
  end

  def test_check_for_commands
    assert_equal("clean install", ConfigurationChecker.new().checkForCommand("ci"))
    assert_raise RuntimeError do
      ConfigurationChecker.new().checkForCommand("boo")
    end
  end

end


