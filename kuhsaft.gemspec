# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kuhsaft/version"

Gem::Specification.new do |s|
  s.name        = "kuhsaft"
  s.version     = '0.4.0' 
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Immanuel Häussermann", "Felipe Kaufmann", "Phil Schilter"]
  s.email       = "info@screenconcept.ch"
  s.homepage    = "http://github.com/screenconcept/kuhsaft"
  s.summary     = %q{A tool that helps you bootstrap your rails projects}
  s.description = %q{Kuhsaft is a rails app bootstrapper} 

  s.rubyforge_project = "kuhsaft"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_development_dependency 'rspec-rails', '>= 2.6'
  #s.add_dependency 'acts-as-taggable-on', '>= 2.0.6'
end
