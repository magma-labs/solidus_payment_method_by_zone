source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }


branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  if branch == 'master' || Gem::Version.new(branch[1..-1]) >= Gem::Version.new('2.5.0')
    gem 'factory_bot', '> 4.10.0'
  else
    gem 'factory_bot', '4.10.0'
  end
end

gemspec
