class ArgumentParser
  public
    def parse(args)
      @myString = ''

      args.each do |a|
        @myString = @myString + a + " "
      end

      @myString.strip!

      @myString
    end
end