# Enable test coverage, it has to be the very first lines
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add support directory scripts
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  # Add more helper methods to be used by all tests here...
end
