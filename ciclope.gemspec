# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ciclope/version"

Gem::Specification.new do |s|
  s.name        = "ciclope"
  s.version     = Ciclope::VERSION
  s.authors     = ["Hugo Geronimo Diaz"]
  s.email       = ["geronimod@gmail.com"]
  s.homepage    = "http://github.com/geronimod/ciclope"
  s.summary     = %q{Simple MySQL Replication Utility.}
  s.description = %q{Simple utility to show the replication status for MySQL hots. Usefull to inspect sencond behind master status. This gem depends on Rails and ActiveRecord as ORM.}

  s.rubyforge_project = "ciclope"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_dependency "rails"
  s.add_dependency "activerecord"
  # s.add_runtime_dependency "rest-client"
end
