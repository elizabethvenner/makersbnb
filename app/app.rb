ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/space/add' do
    erb :add_space
  end

  post '/space' do

  end


  # get '/spaces' do
  #   erb :spaces
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
