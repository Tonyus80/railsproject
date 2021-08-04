ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # The original setting cause ERROR Ruby: SQLite3::BusyException: database is locked:
  #parallelize(workers: :number_of_processors, with: :threads)  #Original setting
  # source https://stackoverflow.com/questions/7154664/ruby-sqlite3busyexception-database-is-locked/62730905#62730905
  #parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #
  # This setting must be included for devise to work
  include Devise::Test::IntegrationHelpers


end
