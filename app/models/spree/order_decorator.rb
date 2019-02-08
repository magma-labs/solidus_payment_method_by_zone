# frozen_string_literal: true

Spree::Order.class_eval do
  def available_payment_methods
    @available_payment_methods ||= Spree::PaymentMethod
        .active
        .available_to_store(store)
        .available_to_users
        .left_joins(:payment_method_zone)
        .where(spree_payment_method_zones: {zone_id: [nil] + Spree::Zone.for_address(ship_address).pluck(&:id)})
        .order(:position)
  end
end
