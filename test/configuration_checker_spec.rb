require "configuration_checker"
require "invalid_command_exception"

describe MavenHelperScript::ConfigurationChecker do
  before(:each) do
    @checker = MavenHelperScript::ConfigurationChecker.new(File.join(File.dirname(__FILE__)), 'm.yml')
  end

  it "should find module by mapping" do
    expect(@checker.check_for_module("p")).to eq "parent"
  end

  it "should send back mapping name when no module found, assume that is the correct module name" do
    expect(@checker.check_for_module("boo")).to eq "boo"
  end

  it "should find command using first characters when not a plugin execution" do
    expect(@checker.check_for_command("ci")).to eq "clean install"
  end

  it "should find plugin execution" do
    expect(@checker.check_for_command("jr")).to eq "jetty:run"
  end

  it "should blow up when can't find command" do
    expect {@checker.check_for_command("j") }.to raise_error(MavenHelperScript::InvalidCommandException)
  end

  it  "should return all command arguments" do
    args = Array['-ff', '-DskipTests']
    expect(@checker.check_for_arguments).to eq args
  end

end