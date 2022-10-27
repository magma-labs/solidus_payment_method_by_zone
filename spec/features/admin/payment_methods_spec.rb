# frozen_string_literal: true

require 'spec_helper'

describe 'Payment methods admin page', js: true do
  stub_authorization!

  let!(:mexico) { create(:zone, name: 'Mexico') }

  context 'when create new payment method' do
    before do
      visit spree.new_admin_payment_method_path
    end

    it 'render correctly' do
      expect(page).to have_content(I18n.t('spree.new_payment_method'))
    end

    it 'succesful create payment method' do
      fill_in 'Name', with: 'Test Payment Method'
      within '#payment_method_zones_field' do
        check 'Mexico'
      end
      click_on('Create')
      expect(page).to have_content("successfully created!")
    end
  end
end
