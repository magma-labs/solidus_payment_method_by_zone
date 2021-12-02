# frozen_string_literal: true

FactoryBot.define do
  factory :state_ja, class: 'Spree::State' do
    transient do
      country_iso { 'MX' }
      state_code { 'JA' }

      carmen_subregion do
        carmen_country = Carmen::Country.coded(country.iso)

        carmen_country.subregions.coded(state_code) ||
          carmen_country.subregions.min_by(&:name) ||
          fail("Country #{country.iso} has no subregions")
      end
    end

    abbr { carmen_subregion.code }
    name { carmen_subregion.name }

    country do |country|
      Spree::Country.find_by(iso: country_iso) ||
        country.association(:country, iso: country_iso)
    end
  end
end
