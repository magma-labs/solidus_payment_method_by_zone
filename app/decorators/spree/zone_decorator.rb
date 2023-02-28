# frozen_string_literal: true

module Spree
  module ZoneDecorator
    def self.prepended(base)
      base.has_and_belongs_to_many :payment_methods,
                                   join_table: 'spree_payment_method_zones'
    end

    ::Spree::Zone.prepend(self)
  end
end
