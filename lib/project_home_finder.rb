require "pathname"

module MavenHelperScript

  class ProjectHomeFinder
    public
    def findProjectDirectory(file)
      checkForProjectArtifacts(file)
    end

    private
    def checkForProjectArtifacts(file)
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

    def outOfDirectoriesToCheck(currentPath)
      currentPath == currentPath.parent
    end

    def foundProjectArtifacts(file)
      FileTest.exist?(File.join(file, 'm.yml')) && FileTest.exist?(File.join(file, 'pom.xml'))
    end

  end

end