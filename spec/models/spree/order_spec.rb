# frozen_string_literal: true

require 'spec_helper'

describe Spree::Order do
  let(:mx) { create(:country_mx) }
  let(:usa) { Spree::Country.find_by(iso: 'US') }
  let(:us_zone) { create(:zone) }
  let(:mx_zone) { create(:zone) }
  let(:us_payment_method) { create(:check_payment_method, name: 'US method', zones: [us_zone]) }
  let(:mx_payment_method) { create(:check_payment_method, name: 'MX method', zones: [mx_zone]) }
  let(:order) { create(:order_with_totals) }

  before(:each) do
    order.line_items << create(:line_item)
    us_zone.members.create(zoneable: usa)
    mx_zone.members.create(zoneable: mx)
  end

  describe 'available_payment_methods' do
    it 'includes frontend payment methods' do
      payment_method = Spree::PaymentMethod::Check.create!(
        {
          name: 'Fake',
          active: true,
          available_to_users: true,
          available_to_admin: false
        }
      )
      expect(order.available_payment_methods).to include(payment_method)
    end

    it 'must not include payment methods for Mexico in addresses of US' do
      expect(order.available_payment_methods).to include(us_payment_method)
      expect(order.available_payment_methods).not_to include(mx_payment_method)
    end

    context 'with mexican address' do
      let(:state) { create(:state_ja, country: mx) }
      let(:address) { create(:address, city: 'Leon', state: state) }
      let(:order) { create(:order_with_totals, ship_address: address) }

      it 'must include mx payment method' do
        expect(order.available_payment_methods).not_to include(us_payment_method)
        expect(order.available_payment_methods).to include(mx_payment_method)
      end
    end

    context 'with address matching more than one zone with same payment method' do
      let(:ja_zone) { create(:zone) }

      before do
        ja_zone.members.create(zoneable: state)
        mx_payment_method.zones.push(ja_zone)
        mx_payment_method.save
      end

      it 'must include unique payment method' do
        expect(order.available_payment_methods.count).to eq(1)
      end

      it 'must include mx payment method' do
        expect(order.available_payment_methods).to include(mx_payment_method)
      end
    end

    context 'with address not matching zones' do
      let(:ar) { create(:country, iso: 'AR') }
      let(:caba) { create(:state_ja, country: ar, state_code: 'C') }
      let(:address) { create(:address, city: 'Recoleta', state: caba) }
      let(:order) { create(:order_with_totals, ship_address: address) }

      it 'must not return any payment method' do
        expect(order.available_payment_methods.count).to eq(0)
      end
    end
  end
end
