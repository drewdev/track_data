# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traktion/version'

Gem::Specification.new do |spec|
  spec.name          = "traktion"
  spec.version       = Traktion::VERSION
  spec.authors       = ["Drew Bisset"]
  spec.email         = ["andrew.bisset@gmail.com"]
  spec.summary       = %q{Provides some silly utilities for working with iTuens metadata.}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/drewdev/traktion"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
