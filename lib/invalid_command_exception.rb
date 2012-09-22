module MavenHelperScript

  class InvalidCommandException < Exception
    def initialize(commands, failedCommand)
      @commands = commands
      @failedCommand = failedCommand
    end

    def commands
      return @commands
    end

    def failedCommand
      return @failedCommand
    end

  end

end
