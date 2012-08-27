require 'rake'

task :default => [:test]

task :test do
  ruby "test/argument_parser_test.rb"
end