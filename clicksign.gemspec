# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clicksign/version'

Gem::Specification.new do |spec|
  spec.name          = 'clicksign'
  spec.version       = Clicksign::VERSION
  spec.authors       = ['Daniel Libanori']
  spec.email         = ['daniellibanori@gmail.com']

  spec.summary       = 'Clicksign API wrapper'
  spec.homepage      = 'https://github.com/clicksign/clicksign-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rack'
end
