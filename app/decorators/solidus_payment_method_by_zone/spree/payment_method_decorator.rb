# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module PaymentMethodDecorator
      extend ActiveSupport::Concern

      included do
        has_many :payment_method_zones, dependent: :destroy
        has_many :zones, through: :payment_method_zones

        scope :available_to_address, ->(address) do
          left_joins(:payment_method_zones).where(spree_payment_method_zones: {
              zone_id: [nil] + ::Spree::Zone.for_address(address).pluck(:id)
          }).distinct
        end
      end
    end
  end
end

::Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::PaymentMethodDecorator
