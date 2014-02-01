# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name            = "resque-timely"
  s.version         = "0.1.0"
  s.authors         = ["Tony Amoyal"]
  s.email           = "tonyamoyal@gmail.com"
  s.description     = "This gem allows you to set time limits on Resque jobs per Job class."
  s.summary         = "For Resque jobs that need a time limit"
  s.homepage        = "http://github.com/getsidewalk/resque-timely"
  s.license         = "MIT"
  s.platform        = Gem::Platform::RUBY
  
  s.files           = `git ls-files`.split("\n")
  s.test_files      = `git ls-files -- {test}/*`.split("\n")
  s.require_paths   = ["lib"]

  s.add_dependency "resque", "~>1.0"
  s.add_dependency "json"
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end