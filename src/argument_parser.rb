require_relative '../src/configuration_checker'

class ArgumentParser
  def initialize
    @configChecker = ConfigurationChecker.new
  end

  public
  def parse(args)
    resultingCommands = Array[]
    specialtyCommands = Array[]
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
          if (!foundModule)
            foundModule = arg
          end
          result << " -pl " << foundModule
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
