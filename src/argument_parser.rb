class ArgumentParser
  @@commands = {
      'c' => 'clean',
      'i' => 'install',
      'ci' => 'clean install',
      'jr' => 'jetty:run',
      'ct' => 'clean test-compile'
  }

  public
  def parse(args)
    @resultingCommands = Array[]
    @result = ''
    @specialtyCommands = Array[]

    args.each do |arg|
      found = @@commands[arg]

      if found != nil
        @result << 'mvn ' << found

      elsif isSpecialtyCommand arg
        @specialtyCommands << arg

      else
        @result << ' -pl ' << arg
        @resultingCommands << @result
        @result = ''
      end

    end

    @specialtyCommands.each do |specialty|
      @resultingCommands.each do |command|
        command << ' ' << specialty
      end
    end

    @resultingCommands
  end

  private
  def isSpecialtyCommand(command)
    if command.start_with?('-')
      return true
    end
    false
  end

end