require './main'
require "./config/environment"
run Sinatra::Application
run Rack::URLMap.new("/" => TodoApi)
set :database, "postgres://localhost/db"
