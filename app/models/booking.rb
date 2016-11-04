require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out, Date
  property :confirmed, Boolean, default: false

  belongs_to :space
  belongs_to :user

  def self.booking_range(check_in, check_out)
    (check_in...check_out).map {|date| date }
  end

  def self.all_space_booking(space_id)
    Booking.all(confirmed: true, space_id: space_id)
  end

  def self.space_bookings(all_bookings)
    all_bookings.map {|bookings| Booking.booking_range(bookings.check_in, bookings.check_out) }.flatten
  end

  def self.check_available(requested_dates, all_booked_dates)
    if (requested_dates.map {|x| all_booked_dates.include?(x)}).include?(true)
      true
    else
      false
    end
  end
end
