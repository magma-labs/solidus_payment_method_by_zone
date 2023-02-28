# frozen_string_literal: true

<<<<<<< Updated upstream
module SolidusPaymentMethodByZone
  module Spree
    module ZoneDecorator
      extend ActiveSupport::Concern
=======
module Spree
  module ZoneDecorator
    def self.prepended(base)
      base.has_and_belongs_to_many :payment_methods, join_table: 'spree_payment_method_zones'
    end
>>>>>>> Stashed changes

      included do
        has_and_belongs_to_many :payment_methods, join_table: 'spree_payment_method_zones'
      end

    end
  end
end

Spree::PaymentMethod.include SolidusPaymentMethodByZone::Spree::ZoneDecorator
