require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../main.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end
