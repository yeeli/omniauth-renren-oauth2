# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-renren-oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-renren-oauth2"
  spec.license = 'MIT'
  spec.authors       = ["ye.li"]
  spec.email         = ["yeeli@outlook.com"]
  spec.description   = %q{OmniAuth Oauth2 strategy for renren.com}
  spec.summary       = %q{OmniAuth Oauth2 strategy for renren.com}
  spec.homepage      = "https://github.com/yeeli/omniauth-renren-oauth2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version = OmniAuth::RenrenOauth2::VERSION

  spec.add_dependency 'omniauth', '~> 1.1'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'
end
