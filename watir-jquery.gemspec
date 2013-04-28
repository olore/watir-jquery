# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watir-jquery/version'

Gem::Specification.new do |gem|
  gem.name          = "watir-jquery"
  gem.version       = WatirJquery::VERSION
  gem.authors       = ["Brian Olore"]
  gem.email         = ["brian@olore.net"]
  gem.description   = %q{Provides abilty to use jQuery selectors in Watir tests}
  gem.summary       = %q{Provides abilty to use jQuery selectors in Watir tests}
  gem.homepage      = "https://github.com/olore/errational"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'watir-webdriver'
end
