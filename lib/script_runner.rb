require 'argument_parser'

module MavenHelperScript

  class ScriptRunner
    LINE = "\n-------------------------------------------------------------------------------\n\n"

    def initialize()
      file = File.join(File.expand_path('.'), 'm.yml')
      @parser = MavenHelperScript::ArgumentParser.new(file)
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



