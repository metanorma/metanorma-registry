# frozen_string_literal: true

source "https://rubygems.org"

gem "graphql"
gem "puma"
gem "rake"
gem "rack-contrib"
gem "sinatra"
gem "sinatra-contrib"
gem "activesupport", "~> 5.2"
# Ruby 3.4 removed `mutex_m` and `bigdecimal` from stdlib default
# gems, but activesupport 5.2 still requires both. Adding them
# explicitly restores compat without touching the activesupport pin
# (which would be a 5→7 major-version bump with API breakage risk).
gem "mutex_m"
gem "bigdecimal"
gem "rexml" unless Gem::Version.new(RUBY_VERSION) < Gem::Version.new("3.0.0")

gem "rspec", group: :test
gem "rack-test", group: :test
gem "pry", "~> 0.12.2", group: [:development, :test]
