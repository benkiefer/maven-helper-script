$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "invalid_command_exception"

describe MavenHelperScript::InvalidCommandException do
  before (:each) do
    @commands = Hash.new()
    @commands["m"] = "make"
    @error = MavenHelperScript::InvalidCommandException.new(@commands, "boom")
  end

  it "should print command mapping" do
    @error.commands.should == @commands
    @error.failedCommand.should == "boom"
  end

end