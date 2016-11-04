require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :location, String
  property :description, String, length: 500
  property :price, Integer
  property :available_from, Date
  property :available_to, Date

  has n, :bookings
  belongs_to :user

end
