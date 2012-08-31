require 'yaml'

class ConfigurationChecker
  def initialize
    @yml = YAML::load(File.open('m.yml'))
  end

  public
  def checkForModule(mapping)
    @yml['mappings'][mapping]
  end

  def checkForCommand(mapping)
    result = ''
    i = 0

    mapping.each_char do |character|
      i += 1
      phase = findPhaseStartingWith(character)

      if phase
        result << phase
      end

      if i < mapping.length
        result << " "
      end
    end
    if result.strip! == ""
      return nil
    end
    result
  end

  private
  def findPhaseStartingWith(character)
    @yml['maven']['phases'].each do |phase|
      if phase.start_with? character
        return phase
      end
    end
    raise "Unable to locate command for: " << character
  end

end