source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'jsonapi-utils', git: 'https://github.com/gaorlov/jsonapi-utils', branch: 'non_ar_paginator_support', ref: '48977c279d9ba1d1877b3811269754f5cbb5ed72'
# env var helpers
gem 'dotenv-rails'
gem 'dalli'

gem 'concourserb', '0.0.16'

# -- ElasticSearch --
gem 'kaminari'

# --- Monitoring ----
gem 'prometheus-client'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'simplecov'
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
