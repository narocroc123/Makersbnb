require 'sinatra/base'

require './database_connection_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/user_sign_up'
  end

  run! if app_file == $0
end
