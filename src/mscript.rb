require_relative 'argument_parser'

LINE = '-------------------------------------------------------------------------------'

commands = ArgumentParser.new().parse(ARGV)

if commands.length > 0
  puts LINE
  puts ''
end

commands.each do |command|
  puts 'Executing Command: ' + command

  puts ''
  puts LINE
  puts ''

  puts %x[#{command}]

  puts ''
  puts LINE
  puts ''
end


