require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out, Date

  belongs_to :space
  belongs_to :user

  def self.booking_range(check_in, check_out)
    (check_in...check_out).map {|date| date }
  end

  def self.all_space_booking(space_id)
    Booking.all(space_id: space_id)
  end

end
