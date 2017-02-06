require './app'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

module AppHelper
  def app
    App.new
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include AppHelper
end