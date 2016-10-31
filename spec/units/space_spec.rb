require 'spec_helper'

describe Space do
  subject(:space) {described_class.new}

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :name }
  it {is_expected.to have_property :location }
  it {is_expected.to have_property :description }
  it {is_expected.to have_property :price}
end
