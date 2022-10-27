# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module PaymentMethodDecorator
      extend ActiveSupport::Concern

      included do
        has_and_belongs_to_many :zones, join_table: 'spree_payment_method_zones'

        scope :available_to_address, ->(address) do
          left_joins(:zones).where(
            spree_zones: {
              id: [nil] + ::Spree::Zone.for_address(address).pluck(:id)
            }
          ).distinct
        end
      end
    end
  end
end

::Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::PaymentMethodDecorator
