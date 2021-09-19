source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "rails", "~> 6.1.3.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.2.1"
gem "webpacker", "~> 5.4.0"
gem "jbuilder", "~> 2.7"
gem "redis", ">= 4.0"
gem "redis-session-store", "~> 0.11.3"
gem "bootsnap", ">= 1.4.4", require: false

gem "cable_ready", "5.0.0.pre2"
gem "stimulus_reflex", "3.5.0.pre2"
gem "pagy", "~> 3.10.0"
gem "faker", "~> 2.18"
gem "kredis", "~> 0.4"
gem "pg_search", "~> 2.3"
gem "all_futures", "~> 1.0.3"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "ruby_jard", "~> 0.3"
  gem "standard", "~> 1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
