# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module ZoneDecorator
      extend ActiveSupport::Concern

      included do
        has_and_belongs_to_many :payment_methods, join_table: 'spree_payment_method_zones'
      end
    end
  end
end

Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::ZoneDecorator
