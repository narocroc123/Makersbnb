require 'sinatra/base'
require './lib/user'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'users/user_sign_up'
  end

  post '/users-add' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/test-properties'
  end

  get '/test-properties' do
    @user = User.find(session[:user_id])
    erb :'/users/welcome_page'
  end

  get '/sessions/new' do
    erb :'/users/user_sign_in'
  end

  post '/sessions' do
    user = User.authenticate( email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/test-properties'
  end


  run! if app_file == $0
end
