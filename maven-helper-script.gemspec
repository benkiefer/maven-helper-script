# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: maven-helper-script 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "maven-helper-script"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["benkiefer"]
  s.date = "2015-04-29"
  s.description = "Execute your complex maven commands faster with the shortened helper syntax. See the rdoc for more details and examples."
  s.email = "ben.a.kiefer@gmail.com"
  s.executables = ["m"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/m",
    "lib/argument_parser.rb",
    "lib/configuration_checker.rb",
    "lib/invalid_command_exception.rb",
    "lib/project_home_finder.rb",
    "lib/script_runner.rb",
    "maven-helper-script.gemspec",
    "sample-mvn-project/m.yml",
    "sample-mvn-project/other/pom.xml",
    "sample-mvn-project/parent/pom.xml",
    "sample-mvn-project/pom.xml",
    "test/argument_parser_spec.rb",
    "test/configuration_checker_map_spec.rb",
    "test/configuration_checker_spec.rb",
    "test/invalid_command_exception_spec.rb",
    "test/m.yml",
    "test/map.yml",
    "test/project_home_finder_spec.rb",
    "travis.yml"
  ]
  s.homepage = "http://benkiefer.github.io/maven-helper-script"
  s.rubygems_version = "2.4.6"
  s.summary = "Ruby gem to simplify maven command execution"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
  end
end

