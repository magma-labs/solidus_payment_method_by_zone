# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module PaymentMethodDecorator
      def self.prepended(base)
        base.class_eval do
          has_many :payment_method_zone
          has_many :zones, through: :payment_method_zone
        end
      end

      ::Spree::PaymentMethod.prepend self
    end
  end
end
