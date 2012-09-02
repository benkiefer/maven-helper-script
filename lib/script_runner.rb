require 'argument_parser'
require 'project_home_finder'

module MavenHelperScript

  class ScriptRunner
    LINE = "\n-------------------------------------------------------------------------------\n\n"

    def initialize()
      finder = MavenHelperScript::ProjectHomeFinder.new
      @projectFolder = finder.findProjectDirectory(File.expand_path("."))
      @parser = MavenHelperScript::ArgumentParser.new(@projectFolder)
    end

    def run(args)
      commands = @parser.parse(args)

      successful = true
      i = 0

      while successful && i < commands.length
        command = commands[i]
        puts LINE
        puts "#{command}"
        puts LINE

        successful = system command
        i += 1
      end

      if successful
        puts LINE
        puts "Successfully executed the following commands: "
        commands.each do |command|
          puts " - " << command
        end
        puts LINE
      else
        puts LINE
        puts "Failed executing command: " << command
        puts LINE
      end

    end

  end

end



