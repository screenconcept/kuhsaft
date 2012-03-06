# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  #require 'rspec/expectations'
  #require 'carrierwave/test/matchers'

  config.include RSpec::Matchers
  #config.include RSpec::Rails
  #config.include CarrierWave::Test::Matchers
  #config.include KuhsaftSpecHelper
  config.include Capybara

  # == Mock Framework
  #config.mock_with :rspec
  #config.use_transactional_fixtures = true
end
