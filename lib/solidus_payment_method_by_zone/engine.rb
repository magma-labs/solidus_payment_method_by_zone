# frozen_string_literal: true

require 'solidus_payment_method_by_zone'

module SolidusPaymentMethodByZone
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_payment_method_by_zone'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
