ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class MakersBnb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/listings' do
    @spaces = Space.all
    erb :spaces
  end

  get '/space/add' do
    erb :add_space
  end

  post '/space' do
    space = Space.create(name: params[:name],
                         location: params[:location],
                         description: params[:description],
                         price: params[:price])
    space.save
    redirect '/listings'
  end


  # get '/spaces' do
  #   erb :spaces
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
