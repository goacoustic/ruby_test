
require 'bundler' ; Bundler.require
require 'sinatra'
configure { set :server, :puma }

# By default Sinatra will return the string as the response.
get '/hello-world' do
  "Hello World!"
end

get '/' do
  erb :index
end