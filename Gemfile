source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "rails", "~> 6.1.3.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.2.1"
gem "webpacker", "~> 5.2.1"
gem "jbuilder", "~> 2.7"
gem "redis", ">= 4.0"
gem "redis-session-store", "~> 0.11.3"
gem "bootsnap", ">= 1.4.4", require: false

gem "cable_ready", github: "stimulusreflex/cable_ready", branch: "master"
gem "stimulus_reflex", github: "stimulusreflex/stimulus_reflex", branch: "master"
gem "pagy", "~> 3.10.0"
gem "faker", "~> 2.16"
gem "kredis", "~> 0.2.3"
gem "pg_search", "~> 2.3"
gem "all_futures", "~> 1.0.2"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "pry-rails"
  gem "standard", "~> 1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
