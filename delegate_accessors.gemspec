# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delegate_accessors/version'

Gem::Specification.new do |spec|
  spec.name                 = "delegate_accessors"
  spec.version              = DelegateAccessors::VERSION
  spec.authors              = ["Guilherme Cavalcanti"]
  spec.email                = ["guilhermec@redu.com.br"]
  spec.summary              = %q{delegates both readers and writers}
  spec.description          = %q{Just like ActiveSupport's delegate but
                                 delegates both readers and writers}
  spec.homepage             = ""
  spec.license              = "MIT"

  spec.files                = `git ls-files`.split($/)
  spec.executables          = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files           = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths        = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
