# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_essential_cms/version"

Gem::Specification.new do |s|

  s.name        = "spree_essential_cms"
  s.version     = SpreeEssentialCms::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/spree_essential_cms"
  s.summary     = %q{SpreeEssentialCms is a full featured content management system for Spree Commerce.}
  s.description = %q{SpreeEssentialCms is a full featured content management system for Spree Commerce. It's designed to be used with the spree_essentials base.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ['lib']

  # Spree Essentials
  s.add_runtime_dependency('spree_essentials', '~> 0.4.0.rc3')

  # Development
  s.add_development_dependency('spree_sample')
	s.add_development_dependency('dummier')
	s.add_development_dependency('shoulda')
	s.add_development_dependency('factory_girl')
	s.add_development_dependency('capybara')
  s.add_development_dependency('sqlite3')
  # s.add_development_dependency('simplecov',    '~> 0.6.1')
  # s.add_development_dependency('turn',         '~> 0.9.3')

end
