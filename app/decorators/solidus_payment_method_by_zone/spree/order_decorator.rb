# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module OrderDecorator
      def available_payment_methods
        @available_payment_methods ||= super.available_to_address(ship_address)
      end

      ::Spree::Order.prepend self
    end
  end
end
