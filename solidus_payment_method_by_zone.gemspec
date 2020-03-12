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

  s.add_runtime_dependency 'solidus_core', '>= 2.2'
  s.add_runtime_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'solidus_support'
  s.add_development_dependency 'solidus_dev_support'
end
