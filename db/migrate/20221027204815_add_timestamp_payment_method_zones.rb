# frozen_string_literal: true

class AddTimestampPaymentMethodZones < SolidusSupport::Migration[6.1]
  def up
    add_timestamps(:spree_payment_method_zones)
  end

  def down
    remove_timestamps(:spree_payment_method_zones)
  end
end
