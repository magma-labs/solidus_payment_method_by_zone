source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

if branch == 'master' || branch >= 'v2.3'
  gem 'rails', '~> 5.1.0'
elsif branch >= 'v2.0'
  gem 'rails', '~> 5.0.0'
else
  gem 'rails_test_params_backport'
  gem 'rails', '~> 4.2.7'
end

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  if branch < 'v2.5'
    gem 'factory_bot', '4.10.0'
  else
    gem 'factory_bot', '> 4.10.0'
  end
  gem 'pry'
  gem 'pry-nav'
end

gemspec
