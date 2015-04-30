require "project_home_finder"

describe MavenHelperScript::ProjectHomeFinder do
  before(:each) do
    @mvn_project_folder = File.expand_path(File.join(File.dirname(__FILE__), "..", "sample-mvn-project"))
    @finder = MavenHelperScript::ProjectHomeFinder.new
  end

  it "should find project folder from sub folder" do
    expect(@finder.find_project_directory(File.join(@mvn_project_folder, "other"))).to eq @mvn_project_folder
    expect(@finder.find_project_directory(File.join(@mvn_project_folder, "parent"))).to eq @mvn_project_folder
  end

  it "should find project folder from project folder" do
    expect(@finder.find_project_directory(File.join(@mvn_project_folder))).to eq @mvn_project_folder
  end

  it "should blow up when can't find project folder" do
    expect { @finder.find_project_directory(File.join(@mvn_project_folder, "..")) }.to raise_error(MavenHelperScript::MissingProjectFolderException)
  end

end