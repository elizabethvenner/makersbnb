require 'spec_helper'

describe User do
  subject(:user) {described_class.new}

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :first_name }
  it {is_expected.to have_property :surname }
  it {is_expected.to have_property :email }
  it {is_expected.to have_property :password_digest}
end
