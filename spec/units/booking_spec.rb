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
                   space_id: house.id,
                   user_id: 2)
  end

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :check_in}
  it {is_expected.to have_property :check_out }
  it {is_expected.to belong_to :space}
  it {is_expected.to belong_to :user}

  it 'is expected to create a range of booking dates' do
    p booking.check_in
    range = Booking.booking_range(booking.check_in, booking.check_out)
    p range
    expect(range.length).to eq 4
  end

  it 'returns all the bookings for a space' do
    bookings = Booking.all_space_booking(house.id)
    p bookings.space
    expect(bookings.length).to eq 1
  end


end
