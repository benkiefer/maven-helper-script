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
    @result = ''

    args.each do |arg|

      found = @@commands[arg]

      if found == nil
        found = ' -pl ' << arg << ' && '
      end

      @result = @result + found

    end

    @result.chomp(' && ')
  end

end