# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module ZoneDecorator
      extend ActiveSupport::Concern

      included do
        has_many :payment_method_zones, dependent: :destroy
        has_many :payment_methods, through: :payment_method_zones
      end

    end
  end
end

Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::ZoneDecorator
