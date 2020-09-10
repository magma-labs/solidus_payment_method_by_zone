# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module PaymentMethodDecorator
      extend ActiveSupport::Concern

      included do
        has_many :payment_method_zones, dependent: :destroy
        has_many :zones, through: :payment_method_zones
      end
    end
  end
end

::Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::PaymentMethodDecorator
