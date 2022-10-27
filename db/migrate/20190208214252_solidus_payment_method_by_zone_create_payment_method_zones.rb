# frozen_string_literal: true

class SolidusPaymentMethodByZoneCreatePaymentMethodZones < SolidusSupport::Migration[5.0]
  def change
    create_table :spree_payment_method_zones do |t|
      t.references :zone
      t.references :payment_method
    end
  end
end
