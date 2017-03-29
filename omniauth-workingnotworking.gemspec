# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-workingnotworking/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-workingnotworking"
  s.version     = OmniAuth::Workingnotworking::VERSION
  s.authors     = ["Rob Cameron"]
  s.email       = ["rob@workingnotworking.com"]
  s.homepage    = "https://github.com/workingnotworking/omniauth-workingnotworking"
  s.description = %q{OmniAuth strategy for Working Not Working}
  s.summary     = s.description
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.3')
  s.add_dependency 'omniauth-oauth2', '~> 1.4'
  s.add_dependency 'rack'
  s.add_development_dependency 'bundler', '~> 1.0'
end
