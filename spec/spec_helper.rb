# frozen_string_literal: true

require "bundler/setup"
require "toy"

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.command_name "RSpec"
  SimpleCov.start
  SimpleCov.at_exit do
    @exit_status = 0
    SimpleCov.result.format!
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
