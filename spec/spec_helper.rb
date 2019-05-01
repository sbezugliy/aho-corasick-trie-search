require 'bundler/setup'
require 'rspec-benchmark'
require 'rspec/collection_matchers'
require 'simplecov'
require 'act/act'
require 'act/trie'
require 'act/vertex'

RSpec.configure do |config|
  config.add_setting :fixtures_path
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.fixtures_path = File.join(__dir__, 'act', 'fixtures')

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
else
  require 'simplecov-console'
  SimpleCov.formatter = SimpleCov::Formatter::Console
end
SimpleCov.start
