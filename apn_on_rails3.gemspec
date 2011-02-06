# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "apn_on_rails3/version"

Gem::Specification.new do |s|
  s.name        = "apn_on_rails3"
  s.version     = ApnOnRails3::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jordan Van Schyndel"]
  s.email       = ["jordanvs@engwise.ca"]
  s.homepage    = ""
  s.summary     = %q{Simplifies the use of Apple Push Notification services within a Rails3 app}
  s.description = %q{Simplifies the use of Apple Push Notification services within a Rails3 app}

  s.rubyforge_project = "apn_on_rails3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
