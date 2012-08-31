require_relative 'argument_parser'

LINE = "\n-------------------------------------------------------------------------------\n\n"

commands = ArgumentParser.new().parse(ARGV)

successful = true
i = 0

while successful && i < commands.length
  command = commands[i]
  puts LINE
  puts "#{command}"
  puts LINE

  successful = system command
  i += 1
end

if successful
  puts LINE
  puts "Successfully executed the following commands: "
  commands.each do|command|
    puts " - " << command
  end
  puts LINE
else
  puts LINE
  puts "Failed executing command: " << command
  puts LINE
end




