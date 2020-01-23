require 'sinatra/base'

require './lib/Listing'
require './database_connection_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    @listings = Listings.all
    erb :listings
  end

  get '/listings/new' do
    erb :new_listing
  end

  post '/listings' do
    Listings.create(property_name: params[:property_name], description: params[:description], available_date: params[:available_date], price: params[:price], available: params[:available])
    redirect '/listings'
  end

  run! if app_file == $0
end
