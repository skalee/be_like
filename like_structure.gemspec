# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "like_structure/version"

Gem::Specification.new do |s|
  s.name        = "like-structure"
  s.version     = LikeStructure::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian Skalacki"]
  s.email       = ["skalee@gmail.com"]
  s.homepage    = "https://github.com/skalee/be_like"
  s.summary     = %q{Like RegExp but for arrays, hashes.}
  s.description = %q{Allows for matching data structures against given criteria. Very useful for testing JSON responses but may be used anywhere.}

#  s.rubyforge_project = "be_like"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'aruba', "~> 0.3.5"
  s.add_development_dependency 'rspec-core', "~>2.0"
  s.add_development_dependency 'cucumber', "~>0.10.2"
end
