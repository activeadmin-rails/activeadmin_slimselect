# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activeadmin/slimselect/version"

Gem::Specification.new do |spec|
  spec.name          = "activeadmin_slimselect"
  spec.version       = ActiveAdmin::SlimSelect::VERSION
  spec.summary       = "SlimSelect for ActiveAdmin"
  spec.description   = "An Active Admin plugin to use SlimSelect.js (no jQuery required)"
  spec.license       = "MIT"
  spec.authors       = ["Piers Chambers"]
  spec.email         = ["piers@varyonic.com"]
  spec.homepage      = "https://github.com/varyonic/activeadmin_slimselect"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/varyonic/activeadmin_slimselect"
  spec.metadata["changelog_uri"] = "https://github.com/varyonic/activeadmin_slimselect/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files         = Dir["{app,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2.0"
end
