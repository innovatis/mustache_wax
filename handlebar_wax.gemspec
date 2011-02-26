# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "handlebar_wax/version"

Gem::Specification.new do |s|
  s.name        = "handlebar_wax"
  s.version     = HandlebarWax::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Burke Libbey"]
  s.email       = ["burke@burkelibbey.org"]
  s.homepage    = "https://github.com/innovatis/handlebar_wax"
  s.summary     = %q{easy reuse of mustache templates between server and client}
  s.description = %q{MustacheWax is a gem that makes rails understand mustache templates, and exposes them all to your client side code using a simple, sane API.}

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
