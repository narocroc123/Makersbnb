require 'sinatra/base'

require './database_connection_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings/new' do
    erb :new_listing
  end

 post '/listings/new' do
    erb :new_listing
  end

  run! if app_file == $0
end
