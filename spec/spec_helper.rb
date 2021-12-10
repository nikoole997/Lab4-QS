require 'simplecov'
SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
end

RSpec.configure do |config|
 

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random
  config.filter_run_when_matching :focus
end
