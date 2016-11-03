require 'spec_helper'

describe Booking do
  subject (:booking) {described_class.new}

  let!(:booking) do
    Booking.create(check_in: "24/04/2016",
                   check_out: "28/04/2016",
                   space_id: 1,
                   user_id: 1)
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


end
