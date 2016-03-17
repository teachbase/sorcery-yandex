# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorcery/yandex/version'

Gem::Specification.new do |spec|
  spec.name          = "sorcery-yandex"
  spec.version       = Sorcery::Yandex::VERSION
  spec.authors       = ["Sergei Alekseenko"]
  spec.email         = ["alekseenkoss@gmail.com"]
  spec.summary       = %q{Sorcery oauth2 provder for yandex.ru}
  spec.description   = %q{Sorcery oauth2 provder for yandex.ru}
  spec.homepage      = "https://github.com/teachbase/sorcery-yandex"
  spec.license       = "MIT"
  
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sorcery", "~> 0.9"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
