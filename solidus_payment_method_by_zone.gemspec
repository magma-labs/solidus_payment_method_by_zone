# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_payment_method_by_zone/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_payment_method_by_zone'
  s.version     = SolidusPaymentMethodByZone::VERSION
  s.summary     = 'Solidus extension to allow payment methods by zones'
  s.description = 'Solidus extension to allow payment methods to be restricted by zones'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Magmalabs'
  s.email     = 'developers@magmalabs.com'
  s.homepage  = 'https://www.magmalabs.io'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.49.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
