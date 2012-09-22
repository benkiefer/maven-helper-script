require 'yaml'
require_relative 'invalid_command_exception'

module MavenHelperScript

  class ConfigurationChecker
    def initialize(file, configFileName)
      @yml = YAML::load_file(File.join(file, configFileName))
      @commands = buildCommandKeys()
    end

    public
    def checkForArguments()
      @yml['arguments'] || Array[]
    end

    def checkForModule(mapping)
      @yml['modules'][mapping] || mapping
    end

    def checkForCommand(mapping)
      result = @commands[mapping]

      if !result
        result = ""
        mapping.each_char do |character|
          command = findCommandFor(character)
          if !command || command.empty?
            raise MavenHelperScript::InvalidCommandException.new(@commands, mapping)
          end
          result << command << " "
        end
        result.strip!
      end

      result
    end

    private
    def buildCommandKeys()
      if @yml['commands'].class ==  Hash
        #They are a map so you don't need to break them up.
        return @yml['commands']
      else
        #Break the list up into a map keyed off the possible command values
        commandKeys = Hash.new()
        @yml['commands'].each do |phase|
          if phase.include? ':'
            key = ""
            phase.split(':').each do |part|
              key << part[0]
            end
            commandKeys[key] = phase
          else
            commandKeys[phase[0]] = phase
          end
        end
        return commandKeys
      end
    end

    def findCommandFor(mapping)
      @commands[mapping] || ""
    end

  end

end