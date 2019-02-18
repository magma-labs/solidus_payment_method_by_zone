# frozen_string_literal: true

 module SolidusPaymentMethodByZone
  module PaymentMethod
    extend ActiveSupport::Concern
    included do
      has_many :payment_method_zone
      has_many :zones, through: :payment_method_zone
    end
  end
end
