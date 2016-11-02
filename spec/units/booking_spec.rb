describe Booking do
  subject (:booking) {described_class.new}

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :begin_date }
  it {is_expected.to have_property :end_date }

end
