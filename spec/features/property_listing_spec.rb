# require 'spec_helper'

RSpec.feature 'see property listing' do
  scenario 'see listing on home page' do
    visit "/"
    expect(page).to have_content("Welcome to MakersBnb!")
    expect(page).to have_content("Stylish appartment in London Bridge.")
    expect(page).to have_content("Location: London Bridge")
    expect(page).to have_content("Description: Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.")
    expect(page).to have_content("Price: £120 per night")
    expect(page).to have_content("Email: example@aol.com")
    expect(page).to have_content("Space available: 1 November 2016")
  end

end
