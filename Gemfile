source "https://rubygems.org"

ruby "3.4.10"

gem "rails", "~> 8.1.3", ">= 8.1.3.1"
# json 3.0 broke ActiveSupport::JSON.decode until a Rails release ships the fix
gem "json", "< 3"
gem "propshaft"
gem "pg", "~> 1.5"
gem "puma", ">= 6.0"
gem "bootsnap", require: false

gem "redis", "~> 5.0"
gem "redis-session-store", "~> 0.11.6"
gem "kredis", "~> 1.8"

gem "cable_ready", "5.0.6"
gem "stimulus_reflex", "3.5.5"
gem "all_futures", "~> 2.0"

gem "jsbundling-rails"
gem "pagy", "~> 9.3"
gem "pg_search"
gem "faker"
gem "kamal", "~> 2.12", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
  gem "standard"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
