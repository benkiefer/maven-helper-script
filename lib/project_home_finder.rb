require "pathname"

module MavenHelperScript

  class ProjectHomeFinder
    public
    def find_project_directory(file)
      @original_path = Pathname.new(File.expand_path(file))
      @path = @original_path
      found = false

      until found
        found = found_project_artifacts(File.join(@path))
        unless found
          if !out_of_directories_to_check @path
            @path = @path.parent
          else
            raise MavenHelperScript::MissingProjectFolderException.new
          end
        end
      end

      File.join(@path)
    end

    private
    def out_of_directories_to_check(current_path)
      current_path == current_path.parent
    end

    def found_project_artifacts(file)
      FileTest.exist?(File.join(file, 'm.yml')) && FileTest.exist?(File.join(file, 'pom.xml'))
    end

  end

  class MissingProjectFolderException < Exception
  end


end