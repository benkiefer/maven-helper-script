$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "project_home_finder"

describe MavenHelperScript::ProjectHomeFinder do
  before(:each) do
    @mvnProjectFolder = File.expand_path(File.join(File.dirname(__FILE__), "..", "sample-mvn-project"))
    @finder = MavenHelperScript::ProjectHomeFinder.new()
  end

  it "should find project folder from sub folder" do
    expect(@finder.findProjectDirectory(File.join(@mvnProjectFolder, "other"))).to eq @mvnProjectFolder
    expect(@finder.findProjectDirectory(File.join(@mvnProjectFolder, "parent"))).to eq @mvnProjectFolder
  end

  it "should find project folder from project folder" do
    expect(@finder.findProjectDirectory(File.join(@mvnProjectFolder))).to eq @mvnProjectFolder
  end

  it "should blow up when can't find project folder" do
    expect { @finder.findProjectDirectory(File.join(@mvnProjectFolder, "..")) }.to raise_error(MavenHelperScript::MissingProjectFolderException)
  end

end