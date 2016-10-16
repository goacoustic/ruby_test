
require 'bundler' ; Bundler.require
require 'sinatra'
require 'json'

configure { set :server, :puma }

post '/message' do
  text = params[:text]

  content_type :json
  { :url => 'https://google.com', :key2 => text }.to_json
end

get '/' do
  erb :index
end