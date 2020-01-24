require 'sinatra/base'
require './lib/Listing'
require 'sinatra/flash'
require './lib/user'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'users/user_sign_up'
  end

  post '/users-add' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/listings' do
    @user = User.find(session[:user_id])
    @listings = Listings.all
    if @user
      erb :'listings/listings'
    else
      flash[:notice] = 'You must be signed in to see or post listings.'
      redirect '/'
    end
  end

  get '/listings/new' do
    @user = User.find(session[:user_id])
    if @user
      erb :'listings/new_listing'
    else
      flash[:notice] = 'You must be signed in to see or post a listings.'
      redirect '/'
    end
  end

  get '/listings/:id' do
    @listing = Listings.select(id: params[:id])
    @user = User.find(@listing.user_id)
    erb :'listings/property_page'
  end

  get '/listings/:id/confirmation' do
    @id = params[:id]
    @listing = Listings.select(id: @id)
    @available = Listings.booked(id: @id)
    erb :'listings/confirmation'
  end

  post '/listings' do
    @user = User.find(session[:user_id])
    Listings.create(user_id: @user.id, property_name: params[:property_name], description: params[:description], available_date: params[:available_date], price: params[:price], available: params[:available])
    redirect '/listings'
  end

  # get '/test-properties' do
  #   @user = User.find(session[:user_id])
  #   erb :'/users/welcome_page'
  # end

  get '/sessions/new' do
    erb :'/users/user_sign_in'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/'
  end

  run! if app_file == $0
end
