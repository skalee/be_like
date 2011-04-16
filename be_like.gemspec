# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "be_like/version"

Gem::Specification.new do |s|
  s.name        = "be-like"
  s.version     = BeLike::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian Skalacki"]
  s.email       = ["skalee@gmail.com"]
  s.homepage    = "https://github.com/skalee/be_like"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

#  s.rubyforge_project = "be_like"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rspec-core', '~>2.0'
end