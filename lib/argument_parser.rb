require_relative 'configuration_checker'

module MavenHelperScript

  class ArgumentParser
    def initialize(file)
      @projectPom = File.join(file, "pom.xml")
      @configChecker = MavenHelperScript::ConfigurationChecker.new(file, 'm.yml')
    end

    public
    def parse(args)
      resultingCommands = Array[]
      specialtyCommands = @configChecker.checkForArguments()
      result = ""
      processingCommand = true

      args.each do |arg|
        if isSpecialtyCommand arg
          specialtyCommands << arg
        else
          if processingCommand
            result << "mvn " << @configChecker.checkForCommand(arg)
            processingCommand = false
          else
            foundModule = @configChecker.checkForModule(arg)
            result << " -pl " << foundModule << " -f " << @projectPom
            resultingCommands << result
            result = ""
            processingCommand = true
          end
        end
      end

      applySpecialtyCommandsTo(specialtyCommands, resultingCommands)

      resultingCommands
    end

    private
    def applySpecialtyCommandsTo(specialtyCommands, resultingCommands)
      specialtyCommands.each do |command|
        resultingCommands.each do |it|
          it = it << " " << command
        end
      end
    end

    def isSpecialtyCommand(command)
      if command.start_with?('-')
        return true
      end
      false
    end

  end
end
