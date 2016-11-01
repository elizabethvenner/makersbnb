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

  get '/user/new' do
    @user = User.new
    erb :signup
  end


  post '/user' do

    @user = User.create(
      first_name: params[:first_name],
      surname: params[:surname],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    @user.save
    redirect to ('/listings')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
