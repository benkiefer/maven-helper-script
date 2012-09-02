$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "project_home_finder"
require "test/unit"

class ProjectHomeFinderTest < Test::Unit::TestCase
  def setup()
    @mvnProjectFolder = File.expand_path(File.join(File.dirname(__FILE__), "..", "sample-mvn-project"))
    @finder = MavenHelperScript::ProjectHomeFinder.new()
  end

  def test_find_project_home
    assert_equal(@mvnProjectFolder, @finder.findProjectDirectory(File.join(@mvnProjectFolder, "other")))
    assert_equal(@mvnProjectFolder, @finder.findProjectDirectory(File.join(@mvnProjectFolder, "parent ")))
    assert_raise RuntimeError do
      @finder.findProjectDirectory(File.join(@mvnProjectFolder, ".."))
    end

  end

end

