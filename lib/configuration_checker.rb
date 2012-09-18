require 'yaml'

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
          result << findCommandFor(character) << " "
        end
        result.strip!
      end


      if !result || result.empty?
        raise "Unable to locate command for: " << mapping
      end

      result
    end

    private
    def buildCommandKeys()
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
      commandKeys
    end

    def findCommandFor(mapping)
      @commands[mapping] || ""
    end

  end

end