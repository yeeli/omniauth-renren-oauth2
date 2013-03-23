# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/renren2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-renren2"
  spec.version       = Omniauth::Renren2::VERSION
  spec.authors       = ["ye.li"]
  spec.email         = ["leeyi1988@gmail.com"]
  spec.description   = %q{OmniAuth Oauth2 strategy for renren.com}
  spec.summary       = %q{OmniAuth Oauth2 strategy for renren.com}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

end
