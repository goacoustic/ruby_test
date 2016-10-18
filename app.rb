
require 'bundler' ; Bundler.require
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/config_file'
require './config/environments'
require './models/message'
require './crypto/crypt'
require 'json'
require 'securerandom'

config_file './config/app.yml'


post '/message' do
  text = Crypt.encrypt(params[:text], settings.cryptoKey)
  id = SecureRandom.hex
  @message = Message.new(text: text, id: id)

  content_type :json
  { :link => "#{settings.webapp}/message/#{id}", :text => text, :success => @message.save }.to_json
end

get '/' do
  erb :index
end

get '/all' do
  @messages = Message.all
  erb :all
end

get '/message/:id' do
  message = Message.find_by_id(params[:id])

  if message
    decryptedText = Crypt.decrypt(message.text, settings.cryptoKey)
    message.destroy

    @model = { 'wepapp' => settings.webapp, 'decryptedText' => decryptedText }
    erb :message
  else
    halt 404, "Not found"
  end
end