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
  gem.name = "mvn-helper-script"
  gem.homepage = "http://github.com/kingOburgers/mvn-helper-script"
  gem.summary = %Q{Ruby gem to simplify maven command execution}
  gem.description = %Q{Ruby gem to simplify maven command execution}
  gem.email = "kieferfam@msn.com"
  gem.authors = ["Ben Kiefer"]
end

Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

