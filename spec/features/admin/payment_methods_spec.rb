# frozen_string_literal: true

require 'spec_helper'

describe 'Payment methods admin page', type: :feature, js: true do
  stub_authorization!

  context 'when create new payment method' do
    before do
      visit spree.new_admin_payment_method_path
    end

    it 'render correctly' do
      expect(page).to have_content(I18n.t('spree.new_payment_method'))
    end
  end
end
