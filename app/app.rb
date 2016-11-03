ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class MakersBnb < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'MakersBnb super secret'

  get '/' do
    redirect to('/listings')
  end

  get '/listings' do
    @spaces = Space.all
    erb :spaces
  end

  get '/space/add' do
    erb :add_space
  end

  post '/space' do
    Space.create(name: params[:name],
    location: params[:location],
    description: params[:description],
    price: params[:price],
    user: current_user)

    redirect '/listings'
  end

post '/space/delete' do
  delete_space = Space.get(params[:space_id])
  delete_space.destroy
  redirect to('/sessions/user/spaces')
end

  get '/user/new' do
    if !current_user
      @user = User.new
      erb :'user/new'
    else
      flash.keep[:notice] = 'Please log out to create a new user!'
      redirect('/listings')
    end
  end

  post '/user' do
    @user = User.create(
    first_name: params[:first_name],
    surname: params[:surname],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )

    if @user.save
      session[:user_id] = @user.id
      redirect to('/listings')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/sessions/new' do
    if !current_user
      erb :'sessions/new'
    else
      flash.keep[:notice] = "Already signed in!"
      redirect to ("/listings")
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] =user.id
      redirect to('/listings')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/sessions/user/spaces' do
    if !current_user
      erb :'listings'
    else
      @user_spaces = Space.all(user: current_user)
      erb :'sessions/user/spaces'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to('/listings')
  end

  post '/book' do
    @booking = Booking.create(
    check_in: params[:check_in],
    space_id: params[:space_id],
    user: current_user)

    if @booking.save
      flash.keep[:notice] = "Thank you. Your request has been sent!"
      redirect to '/listings'
    end
  end

  get '/sessions/user/spaces/requests' do
     @requests = Booking.all(space: Space.all(user: current_user))
     erb :'sessions/user/requests'
   end

   post '/confirm' do
     confirm_space = Space.get(params[:space_id])
     confirm_space.update(available: false)
     flash.keep[:notice] = 'Thank you for confirming this booking'
     redirect to '/sessions/user/spaces/requests'
   end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
