# Run Coverage report
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/dummy'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
  add_group 'Libraries', 'lib'
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
if branch == 'master' || Gem::Version.new(branch[1..-1]) >= Gem::Version.new('2.5.0')
  ENV['FACTORY'] = 'FactoryBot'
else
  ENV['FACTORY'] = 'FactoryGirl'
end

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'solidus_support'
require 'solidus_dev_support/rspec/feature_helper'

require 'capybara/rspec'

require 'spree/testing_support/controller_requests'
require 'spree/testing_support/capybara_ext'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

# Requires factories defined in lib/solidus_payment_method_by_zone/factories.rb
load "#{File.dirname(__FILE__)}/../lib/solidus_payment_method_by_zone/factories.rb"

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Spree::TestingSupport::ControllerRequests, type: :controller
end
