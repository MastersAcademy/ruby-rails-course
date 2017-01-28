require 'sinatra'
require 'sinatra/activerecord'
require 'redcarpet'
# require 'respond_to'
# require 'sinatra-respond_to'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/app')
require 'models/user'
require 'models/post'
require 'routes'
# require 'helpers'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/config')
require 'environments'
require 'constants'


get '/' do
  "<h2>Hello!</h2>"
end

