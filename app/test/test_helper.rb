# Enable test coverage, it has to be the very first lines
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add support directory scripts
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  # Add more helper methods to be used by all tests here...
end
