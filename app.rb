require 'sinatra/base'

require './lib/Listing'
require './database_connection_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    @listings = Listings.all
    erb :'listings/listings'
  end

  get '/listings/new' do
    erb :'listings/new_listing'
  end

  get '/listings/:id' do
    @id = params[:id]
    @listing = Listings.select(id: @id)
    erb :'listings/property_page'
  end

  get '/confirmation' do
    @listing = Listings.all.first
    erb :'listings/confirmation'
  end

  post '/listings' do
    Listings.create(property_name: params[:property_name], description: params[:description], available_date: params[:available_date], price: params[:price], available: params[:available])
    redirect '/listings'
  end

  run! if app_file == $0
end
