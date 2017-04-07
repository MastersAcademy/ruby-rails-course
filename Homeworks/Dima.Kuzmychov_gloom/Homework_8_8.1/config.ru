require './main.rb'
run Sinatra::Application
require "./config/environment"
run Rack::URLMap.new("/" => TodoApi)
set :database, "postgres://localhost/db"
