
require 'bundler' ; Bundler.require
require 'sinatra'
require 'json'
require 'sinatra/activerecord'
require './config/environments'
require './models/message'
require 'securerandom'

configure { set :server, :puma }

post '/message' do
  text = params[:text]
  id = SecureRandom.hex
  @message = Message.new(text: text, id: id)

  content_type :json
  { :link => "#{WEBAPP}/#{id}", :text => text, :success => @message.save }.to_json
end

get '/' do
  erb :index
end

get '/all' do
  @messages = Message.all
  erb :all
end

get '/message/:id' do
  @message = Message.find_by_id(params[:id])

  if @message
    @message.destroy
    erb :message
  else
    halt 404, "Not found"
  end
end