# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "maven-helper-script"
  gem.homepage = "http://github.com/kingOburgers/maven-helper-script"
  gem.summary = %Q{Ruby gem to simplify maven command execution}
  gem.description = %Q{Execute your complex maven commands faster with the shortened helper syntax. See the rdoc for more details and examples.}
  gem.email = "kieferfam@msn.com"
  gem.authors = ["kingOburgers"]
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'test/**/*_spec.rb'
end

task :default => :spec

