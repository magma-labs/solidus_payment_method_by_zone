# frozen_string_literal: true

module Spree
  module PaymentMethodDecorator
    def self.prepended(base)
      base.has_and_belongs_to_many :zones,
                                   join_table: 'spree_payment_method_zones'

      base.scope :available_to_address, ->(address) do
        left_joins(:zones).where(
          spree_zones: {
            id: [nil] + base.for_address(address).pluck(:id)
          }
        ).distinct
      end
    end

    ::Spree::PaymentMethod.prepend(self)
  end
end
