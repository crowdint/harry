# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hogger/version'

Gem::Specification.new do |spec|
  spec.name          = "hogger"
  spec.version       = Hogger::VERSION
  spec.authors       = ["David Padilla"]
  spec.email         = ["david@crowdint.com"]
  spec.description   = %q{VERY simple framework for Web Applications}
  spec.summary       = %q{VERY simple framework for Web Applications}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.files.reject! { |fn| fn =~ /^sample-app/ }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_dependency "haml"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
end
