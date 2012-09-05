$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "configuration_checker"

describe MavenHelperScript::ConfigurationChecker do
  before(:each) do
    @checker = MavenHelperScript::ConfigurationChecker.new(File.join(File.dirname(__FILE__)))
  end

  it "should find module by mapping" do
    @checker.checkForModule("p").should == "parent"
  end

  it "should send back mapping name when no module found, assume that is the correct module name" do
    @checker.checkForModule("boo").should == "boo"
  end

  it "should find command using first characters when not a plugin execution" do
    @checker.checkForCommand("ci").should == "clean install"
  end

  it "should find plugin execution" do
    @checker.checkForCommand("jr").should == "jetty:run"
  end

  it "should blow up when can't find command" do
    expect {@checker.checkForCommand("j") }.to raise_error(RuntimeError, "Unable to locate command for: j")
  end


end