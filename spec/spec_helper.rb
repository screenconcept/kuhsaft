require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec'

RSpec.configure do |config|
  require 'rspec/expectations'
  #require 'carrierwave/test/matchers'

  config.include RSpec::Matchers
  #config.include CarrierWave::Test::Matchers
  #config.include KuhsaftSpecHelper

  # == Mock Framework
  config.mock_with :rspec
  #config.use_transactional_fixtures = true
end
