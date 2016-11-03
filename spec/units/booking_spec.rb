describe Booking do
  subject (:booking) {described_class.new}

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :check_in}
  # it {is_expected.to have_property :check_out }
  it {is_expected.to belong_to :space}
  it {is_expected.to belong_to :user}


end
