# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "handlebar_wax/version"

Gem::Specification.new do |s|
  s.name        = "handlebar_wax"
  s.version     = HandlebarWax::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Burke Libbey"]
  s.email       = ["burke@burkelibbey.org"]
  s.homepage    = ""
  s.summary     = %q{write me later}
  s.description = %q{write me later}

  s.add_runtime_dependency     'yajl-ruby'
  s.add_runtime_dependency     'rails',        '~> 3.0'
  s.add_runtime_dependency     'therubyracer', '~> 0.8.0'

  s.add_development_dependency 'rspec',        '~> 2.1.0'
  s.add_development_dependency 'rcov',         '>= 0'
  s.add_development_dependency 'fakefs'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
