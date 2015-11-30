require File.expand_path "../lib/kiss_shot/version.rb", __FILE__

Gem::Specification.new do |s|
  s.name        = 'kiss_shot'
  s.version     = KissShot::VERSION
  s.date        = '2015-12-01'
  s.summary     = "KissShot is a simple Objective-C code generator"
  s.description = "KissShot is a simple Objective-C code generator"
  s.authors     = ["Yanke Guo"]
  s.email       = 'guoyk@1mxian.com'
  s.files       = ["lib/**/*.rb"]
  s.require_paths = ["lib"]
  s.add_runtime_dependency "activesupport", "~> 4.2"
  s.homepage    = 'http://rubygems.org/gems/kiss_shot'
  s.license     = 'MIT'
end
