# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "kuhsaft"
  s.version     = "0.4.0.alpha"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Immanuel Häussermann", "Felipe Kaufmann", "Phil Schilter", "Marco Ribi"]
  s.email       = "developers@screenconcept.ch"
  s.homepage    = "http://github.com/screenconcept/kuhsaft"
  s.summary     = %q{A tool that helps you to manage your content within your app.}
  s.description = %q{Kuhsaft is a Rails engine that offers a simple CMS.}
  s.rubyforge_project = "kuhsaft"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
