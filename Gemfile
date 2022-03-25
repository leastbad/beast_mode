source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "rails", "~> 6.1.4.1"
gem "pg", "~> 1.2.3"
gem "puma", "~> 5.6.2"
gem "webpacker", "~> 5.4.3"
gem "redis", ">= 4.5.1"
gem "redis-session-store", "~> 0.11.3"
gem "bootsnap", ">= 1.9.1", require: false

gem "cable_ready", "5.0.0.pre8"
gem "stimulus_reflex", "3.5.0.pre8"
gem "pagy", "~> 5.2.2"
gem "faker", "~> 2.19"
gem "kredis", "~> 1.1.0"
gem "pg_search", "~> 2.3.5"
gem 'all_futures', github: 'leastbad/all_futures', branch: 'master'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "ruby_jard"
  gem "standard", "~> 1.4.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
