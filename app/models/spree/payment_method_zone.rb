# frozen_string_literal: true

module Spree
  class PaymentMethodZone < Spree::Base
    belongs_to :zone
    belongs_to :payment_method
  end
end
