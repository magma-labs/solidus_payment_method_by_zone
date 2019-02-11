source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", github: "solidusio/solidus", branch: branch

if branch == 'master' || branch >= "v2.0"
  gem "rails-controller-testing", group: :test
else
  gem "rails", '~> 4.2.7' # workaround for bundler resolution issue
  gem "rails_test_params_backport", group: :test
end

gem 'pg'
gem 'sqlite3', '~> 1.3.6'
gem 'deface'

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
end

group :test do
  if branch == 'master' || branch >= "v2.5"
    gem 'factory_bot', '> 4.10.0'
  else
    gem 'factory_bot', '4.10.0'
  end

  gem 'ffaker'
end

gemspec
