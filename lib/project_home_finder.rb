require "pathname"

module MavenHelperScript

  class ProjectHomeFinder
    public
    def findProjectDirectory(file)
      @originalPath = Pathname.new(File.expand_path(file))
      @path = @originalPath
      found = false

      while !found
        found = foundProjectArtifacts(File.join(@path))
        if !found
          if !outOfDirectoriesToCheck @path
            @path = @path.parent
          else
            raise "Unable to locate configuration and project information for: " << @originalPath.to_s
          end
        end
      end

      File.join(@path)
    end

    private
    def outOfDirectoriesToCheck(currentPath)
      currentPath == currentPath.parent
    end

    def foundProjectArtifacts(file)
      FileTest.exist?(File.join(file, 'm.yml')) && FileTest.exist?(File.join(file, 'pom.xml'))
    end

  end

end