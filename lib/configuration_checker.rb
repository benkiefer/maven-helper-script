require 'yaml'

module MavenHelperScript

  class ConfigurationChecker
    def initialize(file)
      @yml = YAML::load_file file
    end

    public
    def checkForModule(mapping)
      @yml['mappings'][mapping]
    end

    def checkForCommand(mapping)
      result = ''
      i = 0

      while i < mapping.length
        phase = findPhaseStartingWith(mapping[i])
        if phase
          result << phase << " "
        end
        i += 1
      end

      result.strip!

      if result == ""
        return nil
      end

      result
    end

    private
    def findPhaseStartingWith(mapping)
      @yml['maven']['phases'].each do |phase|
        if phase.start_with? mapping
          return phase
        end
      end
      raise "Unable to locate command for: " << mapping
    end

  end

end