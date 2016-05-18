ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

if ENV["SELENIUM"]
  require "simplecov"
  SimpleCov.start 'rails'
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
