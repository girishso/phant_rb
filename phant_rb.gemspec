# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phant_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "phant_rb"
  spec.version       = PhantRb::VERSION
  spec.authors       = ["Girish S"]
  spec.email         = ["girish.sonawane@gmail.com"]
  spec.summary       = %q{Ruby client library for Sparkfun's Phant}
  spec.description   = %q{Ruby client library for Sparkfun's Phant}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rest-client'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'hashie'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

