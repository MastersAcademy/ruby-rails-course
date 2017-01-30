require 'rspec'
include Rack::Test::Methods

def app
  Sinatra::Application
end