require 'yaml'
require 'invalid_command_exception'

module MavenHelperScript

  class ConfigurationChecker
    def initialize(file, config_file_name)
      @yml = YAML::load_file(File.join(file, config_file_name))
      @commands = build_command_keys
    end

    public
    def check_for_arguments
      @yml['arguments'] || Array[]
    end

    def check_for_module(mapping)
      @yml['modules'][mapping] || mapping
    end

    def check_for_command(mapping)
      result = @commands[mapping]

      unless result
        result = ""
        mapping.each_char do |character|
          command = find_command_for(character)
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
    def build_command_keys
      if @yml['commands'].class ==  Hash
        #They are a map so you don't need to break them up.
        return @yml['commands']
      else
        #Break the list up into a map keyed off the possible command values
        command_keys = Hash.new
        @yml['commands'].each do |phase|
          if phase.include? ':'
            key = ""
            phase.split(':').each do |part|
              key << part[0]
            end
            command_keys[key] = phase
          else
            command_keys[phase[0]] = phase
          end
        end
        return command_keys
      end
    end

    def find_command_for(mapping)
      @commands[mapping] || ""
    end

  end

end