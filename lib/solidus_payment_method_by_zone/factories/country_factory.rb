# frozen_string_literal: true

eval(ENV.fetch('FACTORY')).define do
  factory :country_mx, class: 'Spree::Country' do
    iso { 'MX' }

    transient do
      carmen_country { Carmen::Country.coded(iso) || fail("Unknown country iso code: #{iso.inspect}") }
    end

    iso_name { carmen_country.name.upcase }
    name { carmen_country.name }
    iso3 { carmen_country.alpha_3_code }
    numcode { carmen_country.numeric_code }
  end
end
