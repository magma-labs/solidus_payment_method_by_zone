# frozen_string_literal: true

require 'spec_helper'

describe Spree::Order, type: :model do
  let(:mx) { create(:country_mx) }
  let(:us_zone) { create(:zone) }
  let(:mx_zone) { create(:zone) }
  let(:us_payment_method) { create(:check_payment_method,
                                              name: 'US method') }
  let(:mx_payment_method) { create(:check_payment_method,
                                              name: 'MX method') }
  let(:order) { create(:order_with_totals) }

  before(:each) do
    order.line_items << create(:line_item)
  end

  describe 'available_payment_methods' do
    it 'includes frontend payment methods' do
      payment_method = Spree::PaymentMethod::Check.create!({
        name: 'Fake',
        active: true,
        available_to_users: true,
        available_to_admin: false
      })
      expect(order.available_payment_methods).to include(payment_method)
    end

    it 'must not include payment methods for Mexico in addresses of US' do
      us_zone.members.create(zoneable: Spree::Country.find_by(iso: 'US'))
      us_payment_method.zones << us_zone
      mx_zone.members.create(zoneable: mx)
      mx_payment_method.zones << mx_zone
      expect(order.available_payment_methods).to include(us_payment_method)
      expect(order.available_payment_methods).not_to include(mx_payment_method)
    end
  end
end
