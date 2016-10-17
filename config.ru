require './app'

configure :development do
    WEBAPP = 'https://rubytestsonyaisanoob.herokuapp.com'
end

run Sinatra::Application