module MavenHelperScript

  class InvalidCommandException < Exception
    def initialize(commands, failed_command)
      @commands = commands
      @failed_command = failed_command
    end

    def commands
      return @commands
    end

    def failedCommand
      return @failed_command
    end

  end

end
