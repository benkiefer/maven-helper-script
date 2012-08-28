require_relative 'argument_parser'

ArgumentParser.new().parse(ARGV).each do |command|
  puts %x[mvn #{command}]
end

