require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :begin_date, Date
  property :end_date, Date
end
