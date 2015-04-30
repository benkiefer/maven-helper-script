require 'configuration_checker'

module MavenHelperScript

  class ArgumentParser
    def initialize(file)
      @project_pom = File.join(file, "pom.xml")
      @config_checker = MavenHelperScript::ConfigurationChecker.new(file, 'm.yml')
    end

    public
    def parse(args)
      resulting_commands = Array[]
      specialty_commands = @config_checker.check_for_arguments
      result = ""
      processing_command = true

      args.each do |arg|
        if is_specialty_command arg
          specialty_commands << arg
        else
          if processing_command
            result << "mvn " << @config_checker.check_for_command(arg)
            processing_command = false
          else
            found_module = @config_checker.check_for_module(arg)
            result << " -pl " << found_module << " -f " << @project_pom
            resulting_commands << result
            result = ""
            processing_command = true
          end
        end
      end

      apply_specialty_commands_to(specialty_commands, resulting_commands)

      resulting_commands
    end

    private
    def apply_specialty_commands_to(specialty_commands, resulting_commands)
      specialty_commands.each do |command|
        resulting_commands.each do |it|
          it = it << " " << command
        end
      end
    end

    def is_specialty_command(command)
      if command.start_with?('-')
        return true
      end
      false
    end

  end
end
