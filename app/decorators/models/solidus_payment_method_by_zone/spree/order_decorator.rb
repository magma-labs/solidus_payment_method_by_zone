module SolidusPaymentMethodByZone
  module Spree
    module OrderDecorator
      def available_payment_methods
        @available_payment_methods ||= super.left_joins(:payment_method_zone)
             .where(spree_payment_method_zones: {
                 zone_id: [nil] + ::Spree::Zone.for_address(ship_address).pluck(&:id)
             })
      end

      ::Spree::Order.prepend self
    end
  end
end
