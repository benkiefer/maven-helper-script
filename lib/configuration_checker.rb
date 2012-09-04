require 'yaml'

module MavenHelperScript

  class ConfigurationChecker
    def initialize(file)
      @yml = YAML::load_file(File.join(file, 'm.yml'))
      @commands = buildCommandKeys()
    end

    public
    def checkForModule(mapping)
      @yml['mappings'][mapping] || mapping
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
      @yml['maven']['phases'].each do |phase|
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