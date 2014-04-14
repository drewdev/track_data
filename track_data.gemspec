# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'track_data/version'

Gem::Specification.new do |spec|
  spec.name          = "track_data"
  spec.version       = TrackData::VERSION
  spec.authors       = ["Drew"]
  spec.email         = ["andrew.bisset@gmail.com"]
  spec.summary       = %q{Read flat files of track data}
  spec.description   = %q{Parses flat files and returns structured data}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
