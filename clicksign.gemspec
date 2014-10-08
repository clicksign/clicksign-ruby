$:.push File.expand_path("../lib", __FILE__)
require 'clicksign/version'

Gem::Specification.new do |spec|
  spec.name          = "clicksign"
  spec.version       = Clicksign::VERSION
  spec.authors       = ["Clicksign"]
  spec.email         = ["support@clicksign.com"]
  spec.description   = %q{Ruby library to interact with Clicksign}
  spec.summary       = %q{Ruby library to interact with Clicksign}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "rest-client"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
