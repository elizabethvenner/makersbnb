require 'spec_helper'

describe Booking do
  subject (:booking) {described_class.new}

  let!(:user) do
    User.create(first_name: "Jenny",
                surname: "Smith",
                email: "jenny.smith@hotmail.com",
                password: "bau",
                password_confirmation: "bau")
    end

  let!(:house) do
    Space.create(name: "Lovely house in South London",
                 location: "Peckham",
                 description: "A lovely house in Peckham with 2 bedroom and a big kitchen",
                 price: 120,
                 user_id: user.id )
  end

  let!(:booking) do
    Booking.create(check_in: "24/04/2016",
                   check_out: "28/04/2016",
                   confirmed: true,
                   space_id: house.id,
                   user_id: 2)
  end

  let!(:booking2) do
    Booking.new(check_in: "23/04/2016",
                   check_out: "27/04/2016",
                   space_id: house.id,
                   user_id: 5)
  end

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :check_in}
  it {is_expected.to have_property :check_out }
  it {is_expected.to have_property :confirmed}
  it {is_expected.to belong_to :space}
  it {is_expected.to belong_to :user}

  it 'is expected to create a range of booking dates' do
    range = Booking.booking_range(booking.check_in, booking.check_out)
    expect(range.length).to eq 4
  end

  it 'returns all the bookings for a space' do
    bookings = Booking.all_space_booking(house.id)
    expect(bookings.length).to eq 1
  end

  it 'returns an array of all the dates booked' do
    all_bookings = Booking.all_space_booking(house.id)
    expect(Booking.space_bookings(all_bookings).length).to eq 4
  end

  it 'returns true if space is already booked' do
    booking2_range = Booking.booking_range(booking2.check_in, booking2.check_out)
    booked_dates = Booking.all_space_booking(booking2.space_id)
    range = booked_dates.map {|bookings| Booking.booking_range(bookings.check_in, bookings.check_out) }.flatten
    expect(Booking.check_available(booking2_range, range)).to eq true
  end


end
