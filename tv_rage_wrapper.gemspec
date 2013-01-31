# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tv_rage_wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "tv_rage_wrapper"
  gem.version       = TvRageWrapper::VERSION
  gem.authors       = ["Chintan Parikh"]
  gem.email         = ["parikhcv@gmail.com"]
  gem.description   = %q{A simple wrapper for TVRage}
  gem.summary       = %q{A simple wrapper for TVRage}
  gem.homepage      = "https://github.com/chintanparikh/tv_rage_wrapper"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty'
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "rake"

end
